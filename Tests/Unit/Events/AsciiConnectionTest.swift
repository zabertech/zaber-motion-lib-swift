import DtoRequests
import DtoSerializable
import Foundation
import Gateway
import Testing
import ZaberMotionAscii
import ZaberMotionExceptions

@Suite struct AsciiConnectionEventsTests {
    @Test("Receive Alert Event")
    func testReceiveAlertEvent() async throws {
        var eventReceived = false

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.alert.sink { alertEvent in
            #expect(alertEvent.deviceAddress == 1)
            #expect(alertEvent.axisNumber == 2)
            #expect(alertEvent.status == "BUSY")
            #expect(alertEvent.warningFlag == "--")
            #expect(alertEvent.data == "Test")

            eventReceived = true
        }

        let alertEvent = AlertEvent(
            deviceAddress: 1, axisNumber: 2, status: "BUSY", warningFlag: "--", data: "Test")
        let alertEventWrapper = AlertEventWrapper(interfaceId: 3, alert: alertEvent)
        try Events.shared.testSendEvent("interface/alert", alertEventWrapper)

        await waitForExpectation(timeout: .seconds(1), description: "Received alert event") {
            eventReceived
        }

        cancellable.cancel()
    }

    @Test("Alert Event for different connection not received")
    func testNotReceivedAlertEvent() async throws {
        var eventReceivedOtherConnection = false
        var eventReceived = false

        let cancellableOtherConnection = Events.shared.alert.sink { alertEventWrapper in
            if alertEventWrapper.interfaceId == 4 {
                #expect(alertEventWrapper.alert.data == "Other Connection")
                eventReceivedOtherConnection = true
            }
        }
        let connection = Connection(interfaceId: 3)
        let cancellable = connection.alert.sink { alertEvent in
            #expect(alertEvent.data == "Same Connection")
            eventReceived = true
        }

        let alertEventOtherConnection = AlertEvent(
            deviceAddress: 3, axisNumber: 2, status: "BUSY", warningFlag: "--",
            data: "Other Connection")
        let alertEventWrapperOtherConnection = AlertEventWrapper(
            interfaceId: 4, alert: alertEventOtherConnection)
        try Events.shared.testSendEvent("interface/alert", alertEventWrapperOtherConnection)

        let alertEvent = AlertEvent(
            deviceAddress: 3, axisNumber: 2, status: "BUSY", warningFlag: "--",
            data: "Same Connection")
        let alertEventWrapper = AlertEventWrapper(interfaceId: 3, alert: alertEvent)
        try Events.shared.testSendEvent("interface/alert", alertEventWrapper)

        await waitForExpectation(timeout: .seconds(1), description: "Received alert event") {
            eventReceivedOtherConnection && eventReceived
        }

        cancellable.cancel()
        cancellableOtherConnection.cancel()
    }

    @Test("Receive Unknown Response Event")
    func testReceiveUnknownResponseEvent() async throws {
        var eventReceived = false

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.unknownResponse.sink { unknownResponse in
            #expect(unknownResponse.deviceAddress == 1)
            #expect(unknownResponse.axisNumber == 2)
            #expect(unknownResponse.replyFlag == "OK")
            #expect(unknownResponse.status == "IDLE")
            #expect(unknownResponse.warningFlag == "--")
            #expect(unknownResponse.data == "Test")

            eventReceived = true
        }

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, axisNumber: 2, replyFlag: "OK", status: "IDLE", warningFlag: "--",
            data: "Test")
        let unknownResponseEventWrapper = UnknownResponseEventWrapper(
            interfaceId: 3, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent("interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(
            timeout: .seconds(1), description: "Received unknown response event"
        ) { eventReceived }

        cancellable.cancel()
    }

    @Test("Unknown Response Event for different connection not received")
    func testNotReceivedUnknownResponseEvent() async throws {
        var eventReceivedOtherConnection = false
        var eventReceived = false

        let cancellableOtherConnection = Events.shared.unknownResponse.sink {
            unknownResponseEventWrapper in
            if unknownResponseEventWrapper.interfaceId == 4 {
                #expect(unknownResponseEventWrapper.unknownResponse.data == "Other Connection")
                eventReceivedOtherConnection = true
            }
        }

        let connection = Connection(interfaceId: 3)
        let cancellable = connection.unknownResponse.sink { unknownResponseEvent in
            #expect(unknownResponseEvent.data == "Same Connection")

            eventReceived = true
        }

        let unknownResponseEventOtherConnection = UnknownResponseEvent(
            deviceAddress: 1, axisNumber: 2, replyFlag: "OK", status: "IDLE", warningFlag: "--",
            data: "Other Connection")
        let unknownResponseEventWrapperOtherConnection = UnknownResponseEventWrapper(
            interfaceId: 4, unknownResponse: unknownResponseEventOtherConnection)
        try Events.shared.testSendEvent(
            "interface/unknown_response", unknownResponseEventWrapperOtherConnection)

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, axisNumber: 2, replyFlag: "OK", status: "IDLE", warningFlag: "--",
            data: "Same Connection")
        let unknownResponseEventWrapper = UnknownResponseEventWrapper(
            interfaceId: 3, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent("interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(
            timeout: .seconds(1), description: "Received unknown response event"
        ) {
            eventReceivedOtherConnection && eventReceived
        }

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
        var cancellableAlert = connection.alert.sink { _ in
            eventReceived = true
        }
        var cancellableUnknownResponse = connection.unknownResponse.sink { _ in
            eventReceived = true
        }

        let disconnectedEvent = DisconnectedEvent(
            interfaceId: 3, errorType: .connectionClosed, errorMessage: "Test")
        try Events.shared.testSendEvent("interface/disconnected", disconnectedEvent)

        let alertEvent = AlertEvent(
            deviceAddress: 1, axisNumber: 2, status: "BUSY", warningFlag: "--", data: "Test")
        let alertEventWrapper = AlertEventWrapper(interfaceId: 3, alert: alertEvent)
        try Events.shared.testSendEvent("interface/alert", alertEventWrapper)

        let unknownResponseEvent = UnknownResponseEvent(
            deviceAddress: 1, axisNumber: 2, replyFlag: "OK", status: "IDLE", warningFlag: "--",
            data: "Test")
        let unknownResponseEventWrapper = UnknownResponseEventWrapper(
            interfaceId: 3, unknownResponse: unknownResponseEvent)
        try Events.shared.testSendEvent("interface/unknown_response", unknownResponseEventWrapper)

        await waitForExpectation(timeout: .seconds(1), description: "Received disconnected event") {
            disconnectedReceived
        }

        // Re-subscribe and check
        cancellableDisconnected = connection.disconnected.sink { _ in
            eventReceived = true
        }
        cancellableAlert = connection.alert.sink { _ in
            eventReceived = true
        }
        cancellableUnknownResponse = connection.unknownResponse.sink { _ in
            eventReceived = true
        }

        try Events.shared.testSendEvent("interface/alert", alertEventWrapper)
        try Events.shared.testSendEvent("interface/unknown_response", unknownResponseEventWrapper)
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
        cancellableAlert.cancel()
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
                    let subscriber = connection.alert.sink { alertEvent in
                        Task {
                            #expect(alertEvent.deviceAddress == 1)
                            #expect(alertEvent.axisNumber == 2)
                            #expect(alertEvent.status == "BUSY")
                            #expect(alertEvent.warningFlag == "--")
                            #expect(alertEvent.data == "Test")
                            await eventsState.receive()
                        }
                    }
                    await eventsState.addSubscriber(subscriber)
                }
            }

            try await group.waitForAll()
        }

        let alertEvent = AlertEvent(
            deviceAddress: 1, axisNumber: 2, status: "BUSY", warningFlag: "--", data: "Test")
        let alertEventWrapper = AlertEventWrapper(interfaceId: 4, alert: alertEvent)
        try Events.shared.testSendEvent("interface/alert", alertEventWrapper)

        await waitForExpectation(
            timeout: .seconds(2), description: "Received alert event across 1000 tasks"
        ) {
            return await eventsState.eventsReceived == 1000
        }

        await eventsState.cancelSubscribers()
    }
}
