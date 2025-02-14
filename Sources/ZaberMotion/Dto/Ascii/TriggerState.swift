/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The complete state of a trigger.
 */
public struct TriggerState: Serializable {

    /**
     * The firing condition for a trigger.
     */
    public var condition: String

    /**
     * The actions for a trigger.
     */
    public var actions: [String]

    /**
     * The enabled state for a trigger.
     */
    public var enabled: Bool

    /**
     * The number of total fires for this trigger.
     * A value of -1 indicates unlimited fires.
     */
    public var firesTotal: Int

    /**
     * The number of remaining fires for this trigger.
     * A value of -1 indicates unlimited fires remaining.
     */
    public var firesRemaining: Int

    public init(condition: String = "", actions: [String] = [], enabled: Bool = false, firesTotal: Int = 0, firesRemaining: Int = 0) {
        self.condition = condition
        self.actions = actions
        self.enabled = enabled
        self.firesTotal = firesTotal
        self.firesRemaining = firesRemaining
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerState {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerState.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerState", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerState", error: error)
        }
    }
}
