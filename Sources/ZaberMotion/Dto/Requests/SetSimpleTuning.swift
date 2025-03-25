/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct SetSimpleTuning: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var paramset: DtoAscii.ServoTuningParamset
    public var loadMass: Double
    public var loadMassUnits: Units
    public var carriageMass: Double?
    public var carriageMassUnits: Units
    public var motorInertia: Double?
    public var motorInertiaUnits: Units
    public var tuningParams: [DtoAscii.ServoTuningParam]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!, loadMass: Double = 0.0, loadMassUnits: Units = Units.native, carriageMass: Double? = nil, carriageMassUnits: Units = Units.native, motorInertia: Double? = nil, motorInertiaUnits: Units = Units.native, tuningParams: [DtoAscii.ServoTuningParam] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.paramset = paramset
        self.loadMass = loadMass
        self.loadMassUnits = loadMassUnits
        self.carriageMass = carriageMass
        self.carriageMassUnits = carriageMassUnits
        self.motorInertia = motorInertia
        self.motorInertiaUnits = motorInertiaUnits
        self.tuningParams = tuningParams
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetSimpleTuning {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetSimpleTuning.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetSimpleTuning", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetSimpleTuning", error: error)
        }
    }
}
