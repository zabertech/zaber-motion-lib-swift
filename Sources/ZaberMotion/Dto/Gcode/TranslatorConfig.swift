/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Configuration of a translator.
 */
public struct TranslatorConfig: Serializable {

    /**
     * Optional custom mapping of translator axes to stream axes.
     */
    public var axisMappings: [AxisMapping]?

    /**
     * Optional transformation of axes.
     */
    public var axisTransformations: [AxisTransformation]?

    public init(axisMappings: [AxisMapping]? = nil, axisTransformations: [AxisTransformation]? = nil) {
        self.axisMappings = axisMappings
        self.axisTransformations = axisTransformations
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorConfig {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorConfig.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorConfig", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorConfig", error: error)
        }
    }
}
