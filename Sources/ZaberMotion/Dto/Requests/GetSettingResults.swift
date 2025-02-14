/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct GetSettingResults: Serializable {
    public var results: [DtoAscii.GetSettingResult]

    public init(results: [DtoAscii.GetSettingResult] = []) {
        self.results = results
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetSettingResults {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetSettingResults.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetSettingResults", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetSettingResults", error: error)
        }
    }
}
