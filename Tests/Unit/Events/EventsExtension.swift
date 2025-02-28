import DtoRequests
import DtoSerializable

@testable import Gateway

extension Events {
    public func testSendEvent(_ eventType: String, _ event: any Serializable) throws {
        let gatewayEvent = GatewayEvent(event: eventType)
        let eventData = try event.toByteArray()
        eventHandlerPublisher.send([try gatewayEvent.toByteArray(), eventData])
    }
}
