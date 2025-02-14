/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


/**
 * The response from a multi-get axis command.
 */
public struct GetAxisSettingResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The value read.
     */
    public var value: Double

    /**
     * The unit of the values.
     */
    public var unit: Units

    public init(setting: String = "", value: Double = 0.0, unit: Units = Units.native) {
        self.setting = setting
        self.value = value
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetAxisSettingResult {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetAxisSettingResult.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetAxisSettingResult", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetAxisSettingResult", error: error)
        }
    }
}
