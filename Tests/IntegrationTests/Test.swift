import NotificationCenter
import Testing

@testable import DtoRequests
@testable import ZaberMotionExceptions
@testable import Gateway

private enum TestError: Error {
    case timedOut
}

@Suite struct IntegrationTests {
    @Test("Synchronous call")
    func testCallSync() throws {
        let testRequest = TestRequest(
            returnError: false, dataPing: "Hello", returnErrorWithData: false)
        let testResponse: TestResponse = try Gateway.callSync(
            "test/request", testRequest, TestResponse.fromByteArray)

        #expect(testResponse.dataPong == "Hello...")
    }

    @Test("Asynchronous call")
    func testCallAsync() async throws {
        let testRequest = TestRequest(
            returnError: false, dataPing: "Hello", returnErrorWithData: false)
        let testResponse: TestResponse = try await Gateway.callAsync(
            "test/request", testRequest, TestResponse.fromByteArray)

        #expect(testResponse.dataPong == "Hello...")
    }

    @Test("Asynchronous call throws error")
    func testErrorAsync() async throws {
        let testRequest = TestRequest(
            returnError: true, dataPing: "HelloAsyncFail!", returnErrorWithData: false)

        await #expect {
            try await Gateway.callAsync("test/request", testRequest, TestResponse.fromByteArray)
        } throws: { error in
            guard let error = error as? ZaberMotionExceptions.RequestTimeoutException else {
                return false
            }

            return error.message == "Device has not responded in given timeout"
        }
    }

    @Test("Asynchronous call throws error with custom data")
    func testErrorWithCustomData() async throws {
        let testRequest = TestRequest(returnError: false, dataPing: "", returnErrorWithData: true)

        await #expect {
            try await Gateway.callAsync("test/request", testRequest, TestResponse.fromByteArray)
        } throws: {
            error in
            guard let error = error as? InvalidPacketException else {
                return false
            }

            let expectedPacket = "123"
            let expectedReason = "For test"
            let expectedMessage =
                "Cannot parse incoming packet: \"\(expectedPacket)\" (\(expectedReason))"

            return error.message == expectedMessage && error.details.packet == expectedPacket
                && error.details.reason == expectedReason
        }
    }

    @Test("Asynchronous call with long response")
    func testLongResponse() async throws {
        let testRequest = TestRequest(
            returnError: false, dataPing: "Hello", returnErrorWithData: false)
        let testResponse = try await Gateway.callAsync(
            "test/request_long", testRequest, TestResponseLong.fromByteArray)

        for (idx, response) in testResponse.dataPong.enumerated() {
            #expect(response == "Hello...\(idx)")
        }
    }

    @Test("Event emission")
    func testEvent() async throws {
        let event: TestEvent = try await withThrowingTaskGroup(of: TestEvent.self) { group in
            group.addTask {
                try await Gateway.callAsync("test/emit_event")

                for try await testEvent in Events.shared.test.values {
                    return testEvent
                }
                throw TestError.timedOut
            }

            group.addTask {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                throw TestError.timedOut
            }

            let result = try await group.next()!
            group.cancelAll()
            return result
        }

        #expect(event.data == "testing event data")
    }
}
