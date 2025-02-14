/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct GetAxisSettingResults: Serializable {
    public var results: [DtoAscii.GetAxisSettingResult]

    public init(results: [DtoAscii.GetAxisSettingResult] = []) {
        self.results = results
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetAxisSettingResults {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetAxisSettingResults.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetAxisSettingResults", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetAxisSettingResults", error: error)
        }
    }
}
