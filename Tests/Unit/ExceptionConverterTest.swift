import DtoExceptions
import DtoRequests
import Testing
import ZaberMotionExceptions

@Suite struct ExceptionConverterTests {
    @Test("Unknown error type throws DecodingError")
    func testUnknownErrorType() {
        let serialized = ExceptionWireFormat(type: 999, message: "Unknown error.")

        #expect(throws: DecodingError.self) {
            try ExceptionConverter.deserialize(serialized)
        }
    }

    @Test("Missing custom data throws DecodingError")
    func testMissingCustomData() {
        let serialized = ExceptionWireFormat(type: DtoRequests.Errors.movementFailed.rawValue, message: "Movement failed.")

        #expect(throws: DecodingError.self) {
            try ExceptionConverter.deserialize(serialized)
        }
    }
}
