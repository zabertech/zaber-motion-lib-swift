/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


/**
 * Specifies a setting to get with one of the multi-get commands.
 */
public struct GetSetting: Serializable {

    /**
     * The setting to read.
     */
    public var setting: String

    /**
     * The list of axes to read.
     */
    public var axes: [Int]?

    /**
     * The unit to convert the read settings to.
     */
    public var unit: Units?

    public init(setting: String = "", axes: [Int]? = nil, unit: Units? = nil) {
        self.setting = setting
        self.axes = axes
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetSetting {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetSetting.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetSetting", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetSetting", error: error)
        }
    }
}
