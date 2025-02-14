/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Maps a translator axis to a Zaber stream axis.
 */
public struct AxisMapping: Serializable {

    /**
     * Letter of the translator axis (X,Y,Z,A,B,C,E).
     */
    public var axisLetter: String

    /**
     * Index of the stream axis.
     */
    public var axisIndex: Int

    public init(axisLetter: String = "", axisIndex: Int = 0) {
        self.axisLetter = axisLetter
        self.axisIndex = axisIndex
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxisMapping {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxisMapping.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxisMapping", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxisMapping", error: error)
        }
    }
}
