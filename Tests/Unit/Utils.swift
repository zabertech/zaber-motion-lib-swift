import Testing
import Combine

func waitForExpectation(
    timeout: Duration,
    description: String,
    _ expectation: @escaping () async -> Bool
) async {
    let startTime = ContinuousClock.now
    var fulfilled = false

    await confirmation("Waiting for expectation: \(description)", expectedCount: 1) { confirm in
        while !fulfilled && ContinuousClock.now - startTime < timeout {
            if await expectation() {
                fulfilled = true
                confirm()
                break
            }
            await Task.yield()
        }

        if !fulfilled {
            Issue.record("Expectation not fulfilled within \(timeout) seconds: \(description)")
        }
    }
}

actor AsyncSubscribers {
    var eventsReceived = 0
    func receive() {
        eventsReceived += 1
    }
    var subscribers = Set<AnyCancellable>()
    func addSubscriber(_ cancellable: AnyCancellable) {
        subscribers.insert(cancellable)
    }
    func cancelSubscribers() {
        subscribers.forEach { $0.cancel() }
    }
}
