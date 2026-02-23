/* This file is generated. Do not modify by hand. */

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
