/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamBufferGetContentResponse: Serializable {
    public var bufferLines: [String]

    public init(bufferLines: [String] = []) {
        self.bufferLines = bufferLines
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamBufferGetContentResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamBufferGetContentResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamBufferGetContentResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamBufferGetContentResponse", error: error)
        }
    }
}
