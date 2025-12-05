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
    public var loadInertia: Double
    public var loadInertiaUnits: Units
    public var carriageInertia: Double?
    public var carriageInertiaUnits: Units
    public var motorInertia: Double?
    public var motorInertiaUnits: Units
    public var tuningParams: [DtoAscii.ServoTuningParam]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!, loadInertia: Double = 0.0, loadInertiaUnits: Units = Units.native, carriageInertia: Double? = nil, carriageInertiaUnits: Units = Units.native, motorInertia: Double? = nil, motorInertiaUnits: Units = Units.native, tuningParams: [DtoAscii.ServoTuningParam] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.paramset = paramset
        self.loadInertia = loadInertia
        self.loadInertiaUnits = loadInertiaUnits
        self.carriageInertia = carriageInertia
        self.carriageInertiaUnits = carriageInertiaUnits
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
