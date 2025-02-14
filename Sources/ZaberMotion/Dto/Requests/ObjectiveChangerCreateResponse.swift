/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct ObjectiveChangerCreateResponse: Serializable {
    public var turret: Int
    public var focusAddress: Int
    public var focusAxis: Int

    public init(turret: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0) {
        self.turret = turret
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ObjectiveChangerCreateResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ObjectiveChangerCreateResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ObjectiveChangerCreateResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ObjectiveChangerCreateResponse", error: error)
        }
    }
}
