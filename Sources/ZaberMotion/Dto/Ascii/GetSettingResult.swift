/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


/**
 * The response from a multi-get command.
 */
public struct GetSettingResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The list of values returned.
     */
    public var values: [Double]

    /**
     * The unit of the values.
     */
    public var unit: Units

    public init(setting: String = "", values: [Double] = [], unit: Units = Units.native) {
        self.setting = setting
        self.values = values
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetSettingResult {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetSettingResult.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetSettingResult", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetSettingResult", error: error)
        }
    }
}
