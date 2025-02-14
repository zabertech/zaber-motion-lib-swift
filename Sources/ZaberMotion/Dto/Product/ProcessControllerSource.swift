/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The source used by a process in a closed-loop mode.
 */
public struct ProcessControllerSource: Serializable {

    /**
     * The type of input sensor.
     */
    public var sensor: ProcessControllerSourceSensor

    /**
     * The specific input to use.
     */
    public var port: Int

    public init(sensor: ProcessControllerSourceSensor = ProcessControllerSourceSensor(rawValue: 0)!, port: Int = 0) {
        self.sensor = sensor
        self.port = port
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ProcessControllerSource {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ProcessControllerSource.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ProcessControllerSource", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ProcessControllerSource", error: error)
        }
    }
}
