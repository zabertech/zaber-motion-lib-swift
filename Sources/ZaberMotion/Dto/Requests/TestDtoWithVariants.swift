// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
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
}
