import Combine
import DtoRequests
import DtoSerializable
import Foundation
import ZaberMotionCore

let eventHandler: CallbackFn = {
    (response: UnsafeMutableRawPointer, tag: Int64) in
    let responseData = deserialize(response)
    Events.shared.eventHandlerPublisher.send(responseData)
}

public class Events: @unchecked Sendable {
    public static let shared = Events()
    let eventHandlerPublisher = PassthroughSubject<[Data], Never>()

    private init() {
        ZaberMotionCore.zml_setEventHandler(
            0, unsafeBitCast(eventHandler, to: UnsafeMutableRawPointer.self))

        _ = self.unknownResponse
        _ = self.unknownResponseBinary
        _ = self.alert
        _ = self.binaryReplyOnly
        _ = self.disconnected
        _ = self.test
    }

    // Dummy method to be called to make sure that Events singleton has been initialized.
    func ensureInitialized() { }

    public lazy var unknownResponse: AnyPublisher<UnknownResponseEventWrapper, Never> = {
        return eventHandlerPublisher.receive(on: DispatchQueue.main)
            .filter { data in
                self.parseType(gatewayEventData: data[0]) == "interface/unknown_response"
            }.map { data -> UnknownResponseEventWrapper in
                self.deserializeEvent(data[1])
            }.eraseToAnyPublisher()
    }()

    public lazy var unknownResponseBinary: AnyPublisher<UnknownBinaryResponseEventWrapper, Never> =
        {
            return eventHandlerPublisher.receive(on: DispatchQueue.main)
                .filter { data in
                    self.parseType(gatewayEventData: data[0]) == "binary/interface/unknown_response"
                }.map { data -> UnknownBinaryResponseEventWrapper in
                    self.deserializeEvent(data[1])
                }.eraseToAnyPublisher()
        }()

    public lazy var alert: AnyPublisher<AlertEventWrapper, Never> = {
        return eventHandlerPublisher.receive(on: DispatchQueue.main)
            .filter { data in
                self.parseType(gatewayEventData: data[0]) == "interface/alert"
            }.map { data -> AlertEventWrapper in
                self.deserializeEvent(data[1])
            }.eraseToAnyPublisher()
    }()

    public lazy var binaryReplyOnly: AnyPublisher<BinaryReplyOnlyEventWrapper, Never> = {
        return eventHandlerPublisher.receive(on: DispatchQueue.main)
            .filter { data in
                self.parseType(gatewayEventData: data[0]) == "binary/interface/reply_only"
            }.map { data -> BinaryReplyOnlyEventWrapper in
                self.deserializeEvent(data[1])
            }.eraseToAnyPublisher()
    }()

    public lazy var disconnected: AnyPublisher<DisconnectedEvent, Never> = {
        return eventHandlerPublisher.receive(on: DispatchQueue.main)
            .filter { data in
                self.parseType(gatewayEventData: data[0]) == "interface/disconnected"
            }.map { data -> DisconnectedEvent in
                self.deserializeEvent(data[1])
            }.eraseToAnyPublisher()
    }()

    public lazy var test: AnyPublisher<TestEvent, Never> = {
        return eventHandlerPublisher.receive(on: DispatchQueue.main)
            .filter { data in
                self.parseType(gatewayEventData: data[0]) == "test/event"
            }.map { data -> TestEvent in
                self.deserializeEvent(data[1])
            }.eraseToAnyPublisher()
    }()

    private func parseType(gatewayEventData: Data) -> String {
        do {
            let gatewayEvent = try GatewayEvent.fromByteArray(gatewayEventData)
            return gatewayEvent.event
        } catch {
            fatalError("Failed to deserialize GatewayEvent")
        }
    }

    private func deserializeEvent<T: Serializable>(_ data: Data) -> T {
        do {
            return try T.fromByteArray(data)
        } catch {
            fatalError("Failed to deserialize \(type(of: T.self))")
        }
    }
}
