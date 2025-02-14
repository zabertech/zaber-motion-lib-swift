/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


/**
 * Represents a transformation of a translator axis.
 */
public struct AxisTransformation: Serializable {

    /**
     * Letter of the translator axis (X,Y,Z,A,B,C,E).
     */
    public var axisLetter: String

    /**
     * Scaling factor.
     */
    public var scaling: Double?

    /**
     * Translation distance.
     */
    public var translation: Dto.Measurement?

    public init(axisLetter: String = "", scaling: Double? = nil, translation: Dto.Measurement? = nil) {
        self.axisLetter = axisLetter
        self.scaling = scaling
        self.translation = translation
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxisTransformation {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxisTransformation.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxisTransformation", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxisTransformation", error: error)
        }
    }
}
