/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct StreamGetAxesResponse: Serializable {
    public var axes: [DtoAscii.StreamAxisDefinition]
    public var pvtAxes: [DtoAscii.PvtAxisDefinition]

    public init(axes: [DtoAscii.StreamAxisDefinition] = [], pvtAxes: [DtoAscii.PvtAxisDefinition] = []) {
        self.axes = axes
        self.pvtAxes = pvtAxes
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamGetAxesResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamGetAxesResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamGetAxesResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamGetAxesResponse", error: error)
        }
    }
}
