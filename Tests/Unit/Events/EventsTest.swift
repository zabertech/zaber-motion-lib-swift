import Foundation 
import Gateway
import DtoRequests
import Testing

@Suite struct EventsTests {
    @Test("Subscribe across multiple tasks")
    func testSubscribeAcrossMultipleTasks() async throws {
        let eventsState = AsyncSubscribers()

        try await withThrowingTaskGroup(of: Void.self) { group in
            for _ in 0..<1000 {
                group.addTask {
                    let subscriber = Events.shared.test.sink { testEvent in
                        Task {
                            await eventsState.receive()
                        }
                    }
                    await eventsState.addSubscriber(subscriber)
                }
            }

            try await group.waitForAll()
        }

        let testEvent = TestEvent(data: "Test event")
        try Events.shared.testSendEvent("test/event", testEvent)

        await waitForExpectation(timeout: .seconds(2), description: "Received test event across 1000 tasks") {
            return await eventsState.eventsReceived == 1000
        }

        await eventsState.cancelSubscribers()
    }
}
