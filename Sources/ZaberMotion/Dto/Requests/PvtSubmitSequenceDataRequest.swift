/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct PvtSubmitSequenceDataRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var sequenceData: DtoAscii.PvtSequenceData

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, sequenceData: DtoAscii.PvtSequenceData = PvtSequenceData()) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.sequenceData = sequenceData
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtSubmitSequenceDataRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtSubmitSequenceDataRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtSubmitSequenceDataRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtSubmitSequenceDataRequest", error: error)
        }
    }
}
