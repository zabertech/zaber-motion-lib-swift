/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct OpenInterfaceRequest: Serializable {
    public var interfaceType: InterfaceType
    public var portName: String
    public var baudRate: Int
    public var hostName: String
    public var port: Int
    public var transport: Int
    public var rejectRoutedConnection: Bool
    public var cloudId: String
    public var connectionName: String?
    public var realm: String?
    public var token: String
    public var api: String
    public var testPort: Bool
    public var mockDevices: [DtoAscii.MockDevice]?

    public init(interfaceType: InterfaceType = InterfaceType(rawValue: 0)!, portName: String = "", baudRate: Int = 0, hostName: String = "", port: Int = 0, transport: Int = 0, rejectRoutedConnection: Bool = false, cloudId: String = "", connectionName: String? = nil, realm: String? = nil, token: String = "", api: String = "", testPort: Bool = false, mockDevices: [DtoAscii.MockDevice]? = nil) {
        self.interfaceType = interfaceType
        self.portName = portName
        self.baudRate = baudRate
        self.hostName = hostName
        self.port = port
        self.transport = transport
        self.rejectRoutedConnection = rejectRoutedConnection
        self.cloudId = cloudId
        self.connectionName = connectionName
        self.realm = realm
        self.token = token
        self.api = api
        self.testPort = testPort
        self.mockDevices = mockDevices
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OpenInterfaceRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OpenInterfaceRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OpenInterfaceRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OpenInterfaceRequest", error: error)
        }
    }
}
