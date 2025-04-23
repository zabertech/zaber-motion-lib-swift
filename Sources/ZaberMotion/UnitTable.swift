// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Gateway
import DtoRequests

/**
 Module: ZaberMotion

 Helper for working with units of measure.
 */
public final class UnitTable {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Module: ZaberMotion

     Gets the standard symbol associated with a given unit.

     - Parameters:
        - unit: Unit of measure.

     - Returns: Symbols corresponding to the given unit. Throws NoValueForKey if no symbol is defined.
     */
    public static func getSymbol(unit: Units) throws -> String {
        var request = DtoRequests.UnitGetSymbolRequest()
        request.unit = unit

        let response = try Gateway.callSync("units/get_symbol", request, DtoRequests.UnitGetSymbolResponse.fromByteArray)
        return response.symbol
    }

    /**
     Module: ZaberMotion

     Gets the unit enum value associated with a standard symbol.
     Note not all units can be retrieved this way.

     - Parameters:
        - symbol: Symbol to look up.

     - Returns: The unit enum value with the given symbols. Throws NoValueForKey if the symbol is not supported for lookup.
     */
    public static func getUnit(symbol: String) throws -> Units {
        var request = DtoRequests.UnitGetEnumRequest()
        request.symbol = symbol

        let response = try Gateway.callSync("units/get_enum", request, DtoRequests.UnitGetEnumResponse.fromByteArray)
        return response.unit
    }

}
