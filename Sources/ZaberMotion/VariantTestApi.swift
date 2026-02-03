// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Gateway
import DtoRequests
import Utils

/**
 Module: ZaberMotion

 Test case for certain library features. Not public API; do not use.
 */
public final class VariantTestApi {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Module: ZaberMotion

     Tests serialization of variants.

     - Parameters:
        - theVariant: Test value to modify and return.

     - Returns: Mutated input value.
     */
    public static func mutateVariant(theVariant: TestVariant) async throws -> TestVariant? {
        _assertSendable(TestVariant.self)

        var request = DtoRequests.TestDtoWithVariants()
        request.theVariant = theVariant

        let response = try await Gateway.callAsync("test/mutate_variant", request, DtoRequests.TestDtoWithVariants.fromByteArray)
        return response.theVariant
    }

    /**
     Module: ZaberMotion

     Tests serialization of arrays of variants.

     - Parameters:
        - variantArray: Test values to modify and return.

     - Returns: Mutated input values.
     */
    public static func mutateVariantArray(variantArray: [TestVariant]) async throws -> [TestVariant] {
        _assertSendable(TestVariant.self)

        var request = DtoRequests.TestDtoWithVariants()
        request.variantArray = variantArray

        let response = try await Gateway.callAsync("test/mutate_variant", request, DtoRequests.TestDtoWithVariants.fromByteArray)
        return response.variantArray
    }

}
