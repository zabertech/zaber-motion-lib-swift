/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoMicroscopy


public struct WdiGetStatusResponse: Serializable {
    public var status: DtoMicroscopy.WdiAutofocusProviderStatus

    public init(status: DtoMicroscopy.WdiAutofocusProviderStatus = WdiAutofocusProviderStatus()) {
        self.status = status
    }

    public static func fromByteArray(_ byteArray: Data) throws -> WdiGetStatusResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(WdiGetStatusResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "WdiGetStatusResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "WdiGetStatusResponse", error: error)
        }
    }
}
