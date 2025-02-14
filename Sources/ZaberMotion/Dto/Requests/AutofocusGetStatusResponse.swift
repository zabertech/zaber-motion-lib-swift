/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoMicroscopy


public struct AutofocusGetStatusResponse: Serializable {
    public var status: DtoMicroscopy.AutofocusStatus

    public init(status: DtoMicroscopy.AutofocusStatus = AutofocusStatus()) {
        self.status = status
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AutofocusGetStatusResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AutofocusGetStatusResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AutofocusGetStatusResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AutofocusGetStatusResponse", error: error)
        }
    }
}
