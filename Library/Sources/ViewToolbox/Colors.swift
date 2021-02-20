import SwiftUI

public protocol ColorsConfig {
    var pinTintColor: Color { get }
    var secondaryText: Color { get }
}

public enum Colors {
    static var pinTintColor = Color.green
    static var secondaryText = Color.gray

    public static func apply(_ config: ColorsConfig) {
        Self.pinTintColor = config.pinTintColor
        Self.secondaryText = config.secondaryText
    }
}
