/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The masses and parameters last used by simple tuning.
 */
public struct SimpleTuning: Serializable {

    /**
     * Whether the tuning returned is currently in use by this paramset,
     * or if it has been overwritten by a later change.
     */
    public var isUsed: Bool

    /**
     * The mass of the carriage in kg.
     */
    public var carriageMass: Double?

    /**
     * The mass of the load in kg, excluding the mass of the carriage.
     */
    public var loadMass: Double

    /**
     * The parameters used by simple tuning.
     */
    public var tuningParams: [ServoTuningParam]

    public init(isUsed: Bool = false, carriageMass: Double? = nil, loadMass: Double = 0.0, tuningParams: [ServoTuningParam] = []) {
        self.isUsed = isUsed
        self.carriageMass = carriageMass
        self.loadMass = loadMass
        self.tuningParams = tuningParams
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SimpleTuning {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SimpleTuning.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SimpleTuning", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SimpleTuning", error: error)
        }
    }
}
