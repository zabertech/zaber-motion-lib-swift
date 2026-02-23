import Foundation
#if !os(Windows)
import SwiftBSON
#endif

// BSON library dependency contains source code which cannot be compiled on Windows.
#if os(Windows)

public func encodeSerializable<T: Encodable>(obj: T) throws -> Data {
    return try JSONEncoder().encode(obj)
}

public func decodeSerializable<T: Decodable>(type: T.Type, byteArray: Data) throws -> T {
    return try JSONDecoder().decode(T.self, from: byteArray)
}

#else

public func encodeSerializable<T: Encodable>(obj: T) throws -> Data {
    let bson = try BSONEncoder().encode(obj)
    return bson.toData()
}

public func decodeSerializable<T: Decodable>(type: T.Type, byteArray: Data) throws -> T {
    let bson = try BSONDocument(fromBSON: byteArray)
    return try BSONDecoder().decode(T.self, from: bson)
}

#endif
