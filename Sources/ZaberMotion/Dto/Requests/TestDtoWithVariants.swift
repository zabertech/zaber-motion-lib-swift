/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * A test DTO that includes variant types.
 * This is used to verify the correct handling of variant types as members of other DTO types.
 */
public struct TestDtoWithVariants: Serializable {

    /**
     * Single variant instance.
     */
    public var theVariant: TestVariant?

    /**
     * Array of variants.
     */
    public var variantArray: [TestVariant]

    public init(theVariant: TestVariant? = nil, variantArray: [TestVariant] = []) {
        self.theVariant = theVariant
        self.variantArray = variantArray
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestDtoWithVariants {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestDtoWithVariants.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestDtoWithVariants", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestDtoWithVariants", error: error)
        }
    }
}
