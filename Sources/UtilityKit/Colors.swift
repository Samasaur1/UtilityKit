#if !os(Linux)
import AppKit

public extension NSColor {
    /// Create a new `NSColor` object with the given red, green, and blue values, in a range of 0-255. This initializer will fail if
    ///
    /// - Parameters:
    ///   - red: The red component of the color, from 0-255.
    ///   - green: The green component of the color, from 0-255.
    ///   - blue: The blue component of the color, from 0-255.
    public convenience init?(red: Int, green: Int, blue: Int) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /// Create a new `NSColor` object from the given hex value. To use a hex code, ensure you start the hex value with `0x`, such as `0xFF8C00` for a bright orange.
    ///
    /// - Parameter hex: A hex value in the format RRGGBB.
    public convenience init?(_ hex: Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}
#endif
