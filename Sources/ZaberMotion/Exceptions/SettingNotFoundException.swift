// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a get or a set command cannot be found for a setting.
 */
public final class SettingNotFoundException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the SettingNotFoundException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
