/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct AutofocusSetObjectiveParamsRequest: Serializable {
    public var providerId: Int
    public var interfaceId: Int
    public var focusAddress: Int
    public var focusAxis: Int
    public var turretAddress: Int
    public var objective: Int
    public var parameters: [Dto.NamedParameter]

    public init(providerId: Int = 0, interfaceId: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0, turretAddress: Int = 0, objective: Int = 0, parameters: [Dto.NamedParameter] = []) {
        self.providerId = providerId
        self.interfaceId = interfaceId
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
        self.turretAddress = turretAddress
        self.objective = objective
        self.parameters = parameters
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AutofocusSetObjectiveParamsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AutofocusSetObjectiveParamsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AutofocusSetObjectiveParamsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AutofocusSetObjectiveParamsRequest", error: error)
        }
    }
}
