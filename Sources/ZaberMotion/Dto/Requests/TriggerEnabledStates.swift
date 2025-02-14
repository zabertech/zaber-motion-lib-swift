/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct TriggerEnabledStates: Serializable {
    public var states: [DtoAscii.TriggerEnabledState]

    public init(states: [DtoAscii.TriggerEnabledState] = []) {
        self.states = states
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerEnabledStates {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerEnabledStates.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerEnabledStates", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerEnabledStates", error: error)
        }
    }
}
