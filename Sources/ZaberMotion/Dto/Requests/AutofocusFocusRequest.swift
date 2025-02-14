/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct AutofocusFocusRequest: Serializable {
    public var providerId: Int
    public var interfaceId: Int
    public var focusAddress: Int
    public var focusAxis: Int
    public var turretAddress: Int
    public var scan: Bool
    public var once: Bool
    public var timeout: Int

    public init(providerId: Int = 0, interfaceId: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0, turretAddress: Int = 0, scan: Bool = false, once: Bool = false, timeout: Int = 0) {
        self.providerId = providerId
        self.interfaceId = interfaceId
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
        self.turretAddress = turretAddress
        self.scan = scan
        self.once = once
        self.timeout = timeout
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AutofocusFocusRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AutofocusFocusRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AutofocusFocusRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AutofocusFocusRequest", error: error)
        }
    }
}
