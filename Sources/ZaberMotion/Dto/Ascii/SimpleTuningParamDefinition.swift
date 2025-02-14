/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Information about a parameter used for the simple tuning method.
 */
public struct SimpleTuningParamDefinition: Serializable {

    /**
     * The name of the parameter.
     */
    public var name: String

    /**
     * The human readable description of the effect of a lower value on this setting.
     */
    public var minLabel: String

    /**
     * The human readable description of the effect of a higher value on this setting.
     */
    public var maxLabel: String

    /**
     * How this parameter will be parsed by the tuner.
     */
    public var dataType: String

    /**
     * The default value of this parameter.
     */
    public var defaultValue: Double?

    public init(name: String = "", minLabel: String = "", maxLabel: String = "", dataType: String = "", defaultValue: Double? = nil) {
        self.name = name
        self.minLabel = minLabel
        self.maxLabel = maxLabel
        self.dataType = dataType
        self.defaultValue = defaultValue
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SimpleTuningParamDefinition {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SimpleTuningParamDefinition.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SimpleTuningParamDefinition", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SimpleTuningParamDefinition", error: error)
        }
    }
}
