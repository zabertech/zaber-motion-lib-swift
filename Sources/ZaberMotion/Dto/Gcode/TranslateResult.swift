/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Represents a result of a G-code block translation.
 */
public struct TranslateResult: Serializable {

    /**
     * Stream commands resulting from the block.
     */
    public var commands: [String]

    /**
     * Messages informing about unsupported codes and features.
     */
    public var warnings: [TranslateMessage]

    public init(commands: [String] = [], warnings: [TranslateMessage] = []) {
        self.commands = commands
        self.warnings = warnings
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslateResult {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslateResult.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslateResult", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslateResult", error: error)
        }
    }
}
