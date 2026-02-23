import Foundation
import Utils

public protocol Serializable: Codable, Equatable, Sendable {
    static func fromByteArray(_ byteArray: Data) throws -> Self
    func toByteArray() throws -> Data
}

extension Serializable {
    public static func fromByteArray(_ byteArray: Data) throws -> Self {
        do {
            return try decodeSerializable(type: Self.self, byteArray: byteArray)
        } catch {
            throw SerializationError.deserializationFailed(object: "\(Self.self)", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            return try encodeSerializable(obj: self)
        } catch {
            throw SerializationError.serializationFailed(object: "\(Self.self)", error: error)
        }
    }
}
