/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct TriggerOnFireSetToSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var action: DtoAscii.TriggerAction
    public var axis: Int
    public var setting: String
    public var operation: DtoAscii.TriggerOperation
    public var fromAxis: Int
    public var fromSetting: String

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, action: DtoAscii.TriggerAction = TriggerAction(rawValue: 0)!, axis: Int = 0, setting: String = "", operation: DtoAscii.TriggerOperation = TriggerOperation(rawValue: 0)!, fromAxis: Int = 0, fromSetting: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.action = action
        self.axis = axis
        self.setting = setting
        self.operation = operation
        self.fromAxis = fromAxis
        self.fromSetting = fromSetting
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerOnFireSetToSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerOnFireSetToSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerOnFireSetToSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerOnFireSetToSettingRequest", error: error)
        }
    }
}
