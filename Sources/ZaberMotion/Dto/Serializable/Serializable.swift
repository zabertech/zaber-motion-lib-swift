import Foundation

public protocol Serializable: Codable, Equatable, Sendable {
    static func fromByteArray(_ byteArray: Data) throws -> Self
    func toByteArray() throws -> Data
}
