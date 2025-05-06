/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct PvtCsvRequest: Serializable {
    public var sequenceData: DtoAscii.PvtSequenceData
    public var path: String

    public init(sequenceData: DtoAscii.PvtSequenceData = PvtSequenceData(), path: String = "") {
        self.sequenceData = sequenceData
        self.path = path
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtCsvRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtCsvRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtCsvRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtCsvRequest", error: error)
        }
    }
}
