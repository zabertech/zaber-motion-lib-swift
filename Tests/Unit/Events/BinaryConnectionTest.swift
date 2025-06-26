import DtoRequests
import DtoSerializable
import Foundation
import Gateway
import Testing
import ZaberMotionBinary
import ZaberMotionExceptions

@Suite struct BinaryConnectionEventsTests {
    @Test("Receive Reply Only Event")
    func testReceiveReplyOnlyEvent() async throws {
        var eventReceived = false

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.replyOnly.sink { replyOnlyEvent in
            #expect(replyOnlyEvent.deviceAddress == 1)
            #expect(replyOnlyEvent.command == 42)
            #expect(replyOnlyEvent.data == 101)

            eventReceived = true
        }

        let replyOnlyEvent = ReplyOnlyEvent(deviceAddress: 1, command: 42, data: 101)
        let replyOnlyEventWrapper = BinaryReplyOnlyEventWrapper(
            interfaceId: 3, reply: replyOnlyEvent)
        try Events.shared.testSendEvent("binary/interface/reply_only", replyOnlyEventWrapper)

        await waitForExpectation(timeout: .seconds(1), description: "Received reply only event") {
            eventReceived
        }

        cancellable.cancel()
    }

    @Test("Reply Only Event for different connection not received")
    func testNotReceivedReplyOnlyEvent() async throws {
        var eventReceivedOtherConnection = false
        var eventReceived = false

        let cancellableOtherConnection = Events.shared.binaryReplyOnly.sink {
            replyOnlyEventWrapper in
            if replyOnlyEventWrapper.interfaceId == 1 {
                #expect(replyOnlyEventWrapper.reply.data == 101)
                eventReceivedOtherConnection = true
            }
        }

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.replyOnly.sink { replyOnlyEvent in
            #expect(replyOnlyEvent.data == 404)
            eventReceived = true
        }

        let replyOnlyEventOtherConnection = ReplyOnlyEvent(deviceAddress: 1, command: 42, data: 101)
        let replyOnlyEventWrapperOtherConnection = BinaryReplyOnlyEventWrapper(
            interfaceId: 1, reply: replyOnlyEventOtherConnection)
        try Events.shared.testSendEvent(
            "binary/interface/reply_only", replyOnlyEventWrapperOtherConnection)

        let replyOnlyEvent = ReplyOnlyEvent(deviceAddress: 1, command: 42, data: 404)
        let replyOnlyEventWrapper = BinaryReplyOnlyEventWrapper(
            interfaceId: 3, reply: replyOnlyEvent)
        try Events.shared.testSendEvent("binary/interface/reply_only", replyOnlyEventWrapper)

        await waitForExpectation(timeout: .seconds(1), description: "Received reply only event") {
            eventReceivedOtherConnection && eventReceived
        }
        cancellable.cancel()
        cancellableOtherConnection.cancel()
    }

    @Test("Receive Unknown Response Event")
    func testReceiveUnknownResponseEvent() async throws {
        var eventReceived = false

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.unknownResponse.sink { unknownResponseEvent in
            #expect(unknownResponseEvent.deviceAddress == 1)
            #expect(unknownResponseEvent.command == 12)
            #expect(unknownResponseEvent.data == 33)

            eventReceived = true
        }

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, command: 12, data: 33)
        let unknownResponseEventWrapper = UnknownBinaryResponseEventWrapper(
            interfaceId: 3, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent(
            "binary/interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(
            timeout: .seconds(1), description: "Received unknown response event"
        ) { eventReceived }

        cancellable.cancel()
    }

    @Test("Unknown Response Event for different connection not received")
    func testNotReceivedUnknownResponseEvent() async throws {
        var eventReceivedOtherConnection = false
        var eventReceived = false

        let cancellableOtherConnection = Events.shared.unknownResponseBinary.sink {
            unknownResponseEventWrapper in
            if unknownResponseEventWrapper.interfaceId == 6 {
                #expect(unknownResponseEventWrapper.unknownResponse.data == 33)
                eventReceivedOtherConnection = true
            }
        }

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.unknownResponse.sink { unknownResponseEvent in
            #expect(unknownResponseEvent.data == 404)

            eventReceived = true
        }

        let unknownResponseEventOtherConnection = UnknownResponseEvent(
            deviceAddress: 1, command: 12, data: 33)
        let unknownResponseEventWrapperOtherConnection = UnknownBinaryResponseEventWrapper(
            interfaceId: 6, unknownResponse: unknownResponseEventOtherConnection)
        try Events.shared.testSendEvent(
            "binary/interface/unknown_response", unknownResponseEventWrapperOtherConnection)

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, command: 12, data: 404)
        let unknownResponseEventWrapper = UnknownBinaryResponseEventWrapper(
            interfaceId: 3, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent(
            "binary/interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(
            timeout: .seconds(1), description: "Received unknown response event"
        ) { eventReceivedOtherConnection && eventReceived }

        cancellable.cancel()
        cancellableOtherConnection.cancel()
    }

    @Test("Receive Disconnected Event")
    func testReceiveDisconnectedEvent() async throws {
        var eventReceived = false

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.disconnected.sink { error in
            #expect(error is ConnectionClosedException)
            #expect(error.message == "Test")

            eventReceived = true
        }

        let disconnectedEvent = DisconnectedEvent(
            interfaceId: 3, errorType: .connectionClosed, errorMessage: "Test")
        try Events.shared.testSendEvent("interface/disconnected", disconnectedEvent)

        await waitForExpectation(timeout: .seconds(1), description: "Received disconnected event") {
            eventReceived
        }

        cancellable.cancel()
    }

    @Test("Disconnected Event for different connection not received")
    func testNotReceivedDisconnectedEvent() async throws {
        var eventReceivedOtherConnection = false
        var eventReceived = false

        let cancellableOtherConnection = Events.shared.disconnected.sink { disconnectedEvent in
            if disconnectedEvent.interfaceId == 3 {
                #expect(disconnectedEvent.errorMessage == "Other Connection")
                eventReceivedOtherConnection = true
            }
        }

        let connection = Connection(interfaceId: 5)
        let cancellable = connection.disconnected.sink { error in
            #expect(error.message == "Same Connection")

            eventReceived = true
        }

        let disconnectedEventOtherConnection = DisconnectedEvent(
            interfaceId: 3, errorType: .connectionClosed, errorMessage: "Other Connection")
        try Events.shared.testSendEvent("interface/disconnected", disconnectedEventOtherConnection)

        let disconnectedEvent = DisconnectedEvent(
            interfaceId: 5, errorType: .connectionClosed, errorMessage: "Same Connection")
        try Events.shared.testSendEvent("interface/disconnected", disconnectedEvent)

        await waitForExpectation(timeout: .seconds(1), description: "Received disconnected event") {
            eventReceivedOtherConnection && eventReceived
        }

        cancellable.cancel()
        cancellableOtherConnection.cancel()
    }

    @Test("Dont receive other events after disconnected")
    func testDontReceiveOtherEventsAfterDisconnected() async throws {
        var eventReceived = false
        var disconnectedReceived = false

        let connection = Connection(interfaceId: 3)
        var cancellableDisconnected = connection.disconnected.sink { error in
            #expect(error is ConnectionClosedException)
            #expect(error.message == "Test")
            disconnectedReceived = true
        }
        var cancellableReplyOnly = connection.replyOnly.sink { _ in
            eventReceived = true
        }
        var cancellableUnknownResponse = connection.unknownResponse.sink { _ in
            eventReceived = true
        }

        let disconnectedEvent = DisconnectedEvent(
            interfaceId: 3, errorType: .connectionClosed, errorMessage: "Test")
        try Events.shared.testSendEvent("interface/disconnected", disconnectedEvent)

        let replyOnlyEvent = ReplyOnlyEvent(deviceAddress: 1, command: 42, data: 101)
        let replyOnlyEventWrapper = BinaryReplyOnlyEventWrapper(
            interfaceId: 3, reply: replyOnlyEvent)
        try Events.shared.testSendEvent("binary/interface/reply_only", replyOnlyEventWrapper)

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, command: 12, data: 33)
        let unknownResponseEventWrapper = UnknownBinaryResponseEventWrapper(
            interfaceId: 3, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent(
            "binary/interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(timeout: .seconds(1), description: "Received disconnected event") {
            disconnectedReceived
        }

        // Re-subscribe and check
        cancellableDisconnected = connection.disconnected.sink { _ in
            eventReceived = true
        }
        cancellableReplyOnly = connection.replyOnly.sink { _ in
            eventReceived = true
        }
        cancellableUnknownResponse = connection.unknownResponse.sink { _ in
            eventReceived = true
        }

        try Events.shared.testSendEvent("binary/interface/reply_only", replyOnlyEventWrapper)
        try Events.shared.testSendEvent(
            "binary/interface/unknown_response", unknownResponseEventWrapper)
        try Events.shared.testSendEvent("interface/disconnected", disconnectedEvent)

        var endEventReceived = false
        let cancellableEnd = Events.shared.test.sink { _ in
            endEventReceived = true
        }
        try Events.shared.testSendEvent("test/event", TestEvent())

        await waitForExpectation(timeout: .seconds(1), description: "Received end event") {
            endEventReceived
        }

        #expect(eventReceived == false)
        cancellableDisconnected.cancel()
        cancellableReplyOnly.cancel()
        cancellableUnknownResponse.cancel()
        cancellableEnd.cancel()
    }

    @Test("Subscribe across multiple tasks")
    func testSubscribeAcrossMultipleTasks() async throws {
        let eventsState = AsyncSubscribers()
        let connection = Connection(interfaceId: 4)

        try await withThrowingTaskGroup(of: Void.self) { group in
            for _ in 0..<1000 {
                group.addTask {
                    let subscriber = connection.unknownResponse.sink { unknownResponseEvent in
                        Task {
                            #expect(unknownResponseEvent.deviceAddress == 1)
                            #expect(unknownResponseEvent.command == 12)
                            #expect(unknownResponseEvent.data == 33)
                            await eventsState.receive()
                        }
                    }
                    await eventsState.addSubscriber(subscriber)
                }
            }

            try await group.waitForAll()
        }

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, command: 12, data: 33)
        let unknownResponseEventWrapper = UnknownBinaryResponseEventWrapper(
            interfaceId: 4, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent(
            "binary/interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(
            timeout: .seconds(2), description: "Received unknown response event across 1000 tasks"
        ) {
            return await eventsState.eventsReceived == 1000
        }

        await eventsState.cancelSubscribers()
    }
}
