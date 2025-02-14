/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


/**
 * Specifies a setting to get with one of the multi-get commands.
 */
public struct GetAxisSetting: Serializable {

    /**
     * The setting to read.
     */
    public var setting: String

    /**
     * The unit to convert the read setting to.
     */
    public var unit: Units?

    public init(setting: String = "", unit: Units? = nil) {
        self.setting = setting
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetAxisSetting {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetAxisSetting.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetAxisSetting", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetAxisSetting", error: error)
        }
    }
}
