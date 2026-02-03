import NotificationCenter
import Testing

@testable import DtoRequests
@testable import ZaberMotion
@testable import ZaberMotionAscii
@testable import ZaberMotionExceptions


@Suite struct VariantTests {
    @Test("Variant holding AxisType")
    func testVariantCase1() async throws {
        let response = try await VariantTestApi.mutateVariant(theVariant: .axisType(.linear))
        #expect(response != nil)
        #expect(response == .axisType(.rotary))
    }

    @Test("Variant holding IoPortLabel")
    func testVariantCase2() async throws {
        let label = IoPortLabel(portType: .none, channelNumber: 8, label: "")
        let response = try await VariantTestApi.mutateVariant(theVariant: .ioPortLabel(label))
        #expect(response != nil)
        let expected = IoPortLabel(portType: .none, channelNumber: 9, label: "")
        #expect(response == .ioPortLabel(expected))
    }

    @Test("Variant holding integer")
    func testVariantCase3() async throws {
        let response = try await VariantTestApi.mutateVariant(theVariant: .int32(5))
        #expect(response != nil)
        #expect(response == .int32(-5))
    }

    @Test("Variant holding optional double")
    func testVariantCase4a() async throws {
        let response = try await VariantTestApi.mutateVariant(theVariant: .optionalDouble(5.1))
        #expect(response != nil)
        #expect(response == .optionalDouble(2.0 * 5.1))
    }

    @Test("Variant holding null optional double")
    func testVariantCase4b() async throws {
        let response = try await VariantTestApi.mutateVariant(theVariant: .optionalDouble(nil))
        #expect(response != nil)
        #expect(response == .optionalDouble(nil))
    }

    @Test("Variant holding string array")
    func testVariantCase5() async throws {
        let response = try await VariantTestApi.mutateVariant(theVariant: .stringArray(["test", "array"]))
        #expect(response != nil)
        #expect(response == .stringArray(["tset", "yarra"]))
    }

    @Test("Variant array")
    func testVariantArray() async throws {
        let response = try await VariantTestApi.mutateVariantArray(variantArray: [
            .axisType(.linear),
            .ioPortLabel(IoPortLabel(portType: .none, channelNumber: 1, label: "")),
            .int32(10),
            .optionalDouble(nil),
            .optionalDouble(3.5),
            .stringArray(["hello", "world"])
        ])

        #expect(response.count == 6)
        #expect(response[0] == .axisType(.rotary))
        #expect(response[1] == .ioPortLabel(IoPortLabel(portType: .none, channelNumber: 2, label: "")))
        #expect(response[2] == .int32(-10))
        #expect(response[3] == .optionalDouble(nil))
        #expect(response[4] == .optionalDouble(2.0 * 3.5))
        #expect(response[5] == .stringArray(["olleh", "dlrow"]))
    }
}
