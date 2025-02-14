/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct StreamModeResponse: Serializable {
    public var streamMode: DtoAscii.StreamMode
    public var pvtMode: DtoAscii.PvtMode

    public init(streamMode: DtoAscii.StreamMode = StreamMode(rawValue: 0)!, pvtMode: DtoAscii.PvtMode = PvtMode(rawValue: 0)!) {
        self.streamMode = streamMode
        self.pvtMode = pvtMode
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamModeResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamModeResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamModeResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamModeResponse", error: error)
        }
    }
}
