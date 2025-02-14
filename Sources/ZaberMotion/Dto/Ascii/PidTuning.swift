/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The tuning of this axis represented by PID parameters.
 */
public struct PidTuning: Serializable {

    /**
     * The tuning algorithm used to tune this axis.
     */
    public var type: String

    /**
     * The version of the tuning algorithm used to tune this axis.
     */
    public var version: Int

    /**
     * The positional tuning argument.
     */
    public var p: Double

    /**
     * The integral tuning argument.
     */
    public var i: Double

    /**
     * The derivative tuning argument.
     */
    public var d: Double

    /**
     * The frequency cutoff for the tuning.
     */
    public var fc: Double

    public init(type: String = "", version: Int = 0, p: Double = 0.0, i: Double = 0.0, d: Double = 0.0, fc: Double = 0.0) {
        self.type = type
        self.version = version
        self.p = p
        self.i = i
        self.d = d
        self.fc = fc
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PidTuning {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PidTuning.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PidTuning", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PidTuning", error: error)
        }
    }
}
