/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct PvtSaveCsvRequest: Serializable {
    public var sequenceData: DtoAscii.PvtSequenceData
    public var path: String
    public var dimensionNames: [String]?

    public init(sequenceData: DtoAscii.PvtSequenceData = PvtSequenceData(), path: String = "", dimensionNames: [String]? = nil) {
        self.sequenceData = sequenceData
        self.path = path
        self.dimensionNames = dimensionNames
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtSaveCsvRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtSaveCsvRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtSaveCsvRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtSaveCsvRequest", error: error)
        }
    }
}
