/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct AxesGetSettingRequest: Serializable {
    public var interfaces: [Int]
    public var devices: [Int]
    public var axes: [Int]
    public var unit: [Units]
    public var setting: String

    public init(interfaces: [Int] = [], devices: [Int] = [], axes: [Int] = [], unit: [Units] = [], setting: String = "") {
        self.interfaces = interfaces
        self.devices = devices
        self.axes = axes
        self.unit = unit
        self.setting = setting
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxesGetSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxesGetSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxesGetSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxesGetSettingRequest", error: error)
        }
    }
}
