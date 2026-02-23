/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct TestRequest: Serializable {
    public var returnError: Bool
    public var dataPing: String
    public var returnErrorWithData: Bool

    public init(returnError: Bool = false, dataPing: String = "", returnErrorWithData: Bool = false) {
        self.returnError = returnError
        self.dataPing = dataPing
        self.returnErrorWithData = returnErrorWithData
    }
}
