// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Represents a result of a G-code block translation.
 */
public struct TranslateResult: Serializable {

    /**
     * Stream commands resulting from the block.
     */
    public var commands: [String]

    /**
     * Messages informing about unsupported codes and features.
     */
    public var warnings: [TranslateMessage]

    public init(commands: [String] = [], warnings: [TranslateMessage] = []) {
        self.commands = commands
        self.warnings = warnings
    }
}
