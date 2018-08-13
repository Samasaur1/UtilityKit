import Foundation
import SpriteKit

/// A protocol for all button nodes.
public protocol SKButton {
    /// A typealias for the closure to be called on clicks.
    typealias Handler = () -> ()
    /// The closure to be called on a click.
    var onClick: Handler { get set }
    /// Called when this node is clicked. Should simply call the closure stored in `onClick`.
    ///
    /// - Parameter event: An object encapsulating information about the mouse-down event.
    func mouseDown(with event: NSEvent)
}

/// A SKSpriteNode that makes clicks easier to handle.
open class SKSpriteButton: SKSpriteNode, SKButton {
    public var onClick: SKButton.Handler
    /// Called whenever this node is clicked. Simply calls the closure stored in `onClick`.
    ///
    /// - Parameter event: An object encapsulating information about the mouse-down event.
    open override func mouseDown(with event: NSEvent) {
        onClick()
    }
    
    /// Creates a new `SKSpriteButton` from the given image, with the given click handler.
    ///
    /// This is identical to the `SKSpriteNode.init(imageNamed:)` initializer, but also has an argument for the click handler. In addition, it is a designated initializer for this class, so it can be called using `super.init(imageNamed:onClick:)` in the initializer of a subclass.
    ///
    /// - Parameters:
    ///   - imageNamed: The name of the image file to use as the texture.
    ///   - handler: The closure to be called on a click.
    public init(imageNamed: String, onClick handler: @escaping Handler) {
        self.onClick = handler
        let t = SKTexture(imageNamed: imageNamed)
        super.init(texture: t, color: SKColor.clear, size: t.size())
        self.isUserInteractionEnabled = true
    }
    
    /// Creates a new `SKSpriteButton` from the given texture, color, and size, with the given click handler.
    ///
    /// This is identical to the `SKSpriteNode.init(texture:color:size:)` initializer, but it also has an argument for the click handler. It is also a designated initializer for this class, so it can be called using `super.init(texture:color:size:onClick:)` in the initializer of a subclass.
    ///
    /// This initializer mimics the only designated initializer for `SKSpriteNode`, and, because the `texture` parameter has a default value, it mimics `SKSpriteNode.init(color:size:)` as well.
    ///
    /// - Parameters:
    ///   - texture: The texture for this button. Can be omitted or can be `nil`.
    ///   - color: The color for the new button.
    ///   - size: The size of the new button.
    ///   - handler: The closure to be called on a click.
    public init(texture: SKTexture? = nil, color: SKColor, size: CGSize, onClick handler: @escaping Handler) {
        self.onClick = handler
        super.init(texture: texture, color: color, size: size)
        self.isUserInteractionEnabled = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

open class SKShapeButton: SKShapeNode, SKButton {
    public var onClick: SKButton.Handler
    open override func mouseDown(with event: NSEvent) {
        onClick()
    }
    
    public init(onClick handler: @escaping Handler) {
        onClick = handler
        super.init()
        self.isUserInteractionEnabled = true
    }
    
    public convenience init(rectOf size: CGSize, cornerRadius radius: CGFloat, onClick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(roundedRect: CGRect(origin: CGPoint.zero, size: size), cornerWidth: radius, cornerHeight: radius, transform: nil)
    }
    
    public convenience init(circleOfRadius radius: CGFloat, onClick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint.zero, size: CGSize(width: radius, height: radius)), transform: nil)
    }
    
    public convenience init(path: CGPath, centered _: Bool = false, onClick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = path
    }
    
    public convenience init(rect: CGRect, cornerRadius radius: CGFloat, onclick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(roundedRect: rect, cornerWidth: radius, cornerHeight: radius, transform: nil)
    }
    
    public convenience init(ellipseOf size: CGSize, onclick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint.zero, size: size), transform: nil)
    }
    
    public convenience init(ellipseIn rect: CGRect, onclick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(ellipseIn: rect, transform: nil)
    }
    
    public convenience init(rectOf size: CGSize, onclick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(rect: CGRect(origin: CGPoint.zero, size: size), transform: nil)
    }
    
    public convenience init(rect: CGRect, onclick handler: @escaping Handler) {
        self.init(onClick: handler)
        self.path = CGPath(rect: rect, transform: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
