import XCTest
import SpriteKit
@testable import UtilityKit

final class SKButtonTests: XCTestCase {
    
    //MARK: - SKSpriteButton intialization tests.
    
    func testSpriteButtonNamed() {
        let imageName = "hello"
        
        let spriteButton = SKSpriteButton(imageNamed: imageName) {}
        let spriteNode = SKSpriteNode(imageNamed: imageName)
        
        compare(spriteButton, with: spriteNode)
    }
    
    func testSpriteButtonTextureColorSize() {
        let texture = SKTexture(imageNamed: "hello")
        let color = SKColor.clear
        let size = CGSize(width: 100, height: 100)
        
        let spriteButton = SKSpriteButton(texture: texture, color: color, size: size) {}
        let spriteNode = SKSpriteNode(texture: texture, color: color, size: size)
        
        compare(spriteButton, with: spriteNode)
    }
    
    func testSpriteButtonColorSize() {
        let color = SKColor.clear
        let size = CGSize(width: 100, height: 100)
        
        let spriteButton = SKSpriteButton(color: color, size: size) {}
        let spriteNode = SKSpriteNode(color: color, size: size)
        
        compare(spriteButton, with: spriteNode)
    }
    
    func testNilVsEmptyTexture() {
        let color = SKColor.clear
        let size = CGSize(width: 100, height: 100)
        
        let button1 = SKSpriteButton(texture: nil, color: color, size: size) {}
        let button2 = SKSpriteButton(color: color, size: size) {}
        
        compare(button1, with: button2)
    }
    
    //MARK: - SKShapeButton initialization tests.
    
    func testShapeButtonCircleOfRadius() {
        let radius: CGFloat = 50
        
        let shapeButton = SKShapeButton(circleOfRadius: radius) {}
        let shapeNode = SKShapeNode(circleOfRadius: radius)
        
        compare(shapeButton, with: shapeNode)
    }
    
    func testShapeButtonEllipseOf() {
        let size = CGSize(width: 50, height: 50)
        
        let shapeButton = SKShapeButton(ellipseOf: size) {}
        let shapeNode = SKShapeNode(ellipseOf: size)
        
        compare(shapeButton, with: shapeNode)
    }
    
    func testShapeButtonEllipseIn() {
        let rect = CGRect(x: 50, y: 50, width: 50, height: 50)
        
        let shapeButton = SKShapeButton(ellipseIn: rect) {}
        let shapeNode = SKShapeNode(ellipseIn: rect)
        
        compare(shapeButton, with: shapeNode)
    }
    
    func testShapeButtonPath() {
        let path1 = CGPath(ellipseIn: CGRect(x: 50, y: 50, width: 50, height: 50), transform: nil)
        let path2 = CGPath(rect: CGRect(x: 50, y: 50, width: 50, height: 50), transform: nil)
        let path3 = CGPath(roundedRect: CGRect(x: 50, y: 50, width: 50, height: 50), cornerWidth: 5, cornerHeight: 15, transform: nil)
        
        let shapeButton1true = SKShapeButton(path: path1, centered: true) {}
        let shapeButton1false = SKShapeButton(path: path1, centered: false) {}
        let shapeButton2true = SKShapeButton(path: path2, centered: true) {}
        let shapeButton2false = SKShapeButton(path: path2, centered: false) {}
        let shapeButton3true = SKShapeButton(path: path3, centered: true) {}
        let shapeButton3false = SKShapeButton(path: path3, centered: false) {}
        let shapeNode1true = SKShapeNode(path: path1, centered: true)
        let shapeNode1false = SKShapeNode(path: path1, centered: false)
        let shapeNode2true = SKShapeNode(path: path2, centered: true)
        let shapeNode2false = SKShapeNode(path: path2, centered: false)
        let shapeNode3true = SKShapeNode(path: path3, centered: true)
        let shapeNode3false = SKShapeNode(path: path3, centered: false)
        
        compare(shapeButton1true, with: shapeNode1true)
        compare(shapeButton1false, with: shapeNode1false)
        compare(shapeButton2true, with: shapeNode2true)
        compare(shapeButton2false, with: shapeNode2false)
        compare(shapeButton3true, with: shapeNode3true)
        compare(shapeButton3false, with: shapeNode3false)
    }
    
    func testShapeButtonRect() {
//        let shapeButton = SKShapeButton(rect: <#T##CGRect#>, onclick: <#T##() -> ()#>)
    }
    
    func testShapeButtonRectCornerRadius() {
        
    }
    
    func testShapeButtonRectOf() {
        
    }
    
    func testShapeButtonRectOfCornerRadius() {
        
    }
    
    //MARK: - Other SKButton tests.
    
    func testProtocolConformance() {
        
    }
    
    //MARK: - Helper methods.
    
    public func reflexiveAssertEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ file: StaticString = #file, _ line: UInt = #line) where T: Equatable {
        XCTAssertEqual(expression1, expression2, file: file, line: line)
        XCTAssertEqual(expression2, expression1, file: file, line: line)
    }
    
    func compare(_ node1: SKSpriteNode, with node2: SKSpriteNode, file: StaticString = #file, line: UInt = #line) {
        reflexiveAssertEqual(node1.texture.debugDescription, node2.texture.debugDescription, file, line)
        
        if node1.color.alphaComponent == 0 && node2.color.alphaComponent == 0 {
            XCTAssert(true)
        } else {
            reflexiveAssertEqual(node1.color.debugDescription, node2.color.debugDescription, file, line)
        }
        
        reflexiveAssertEqual(node1.size.debugDescription, node2.size.debugDescription, file, line)
    }
    
    func compare(_ node1: SKShapeNode, with node2: SKShapeNode, file: StaticString = #file, line: UInt = #line) {
        if node1.fillColor.alphaComponent == 0 && node2.fillColor.alphaComponent == 0 {
            XCTAssert(true)
        } else {
            reflexiveAssertEqual(node1.fillColor.debugDescription, node2.fillColor.debugDescription)
        }
        reflexiveAssertEqual(node1.fillShader.debugDescription, node2.fillShader.debugDescription)
        reflexiveAssertEqual(node1.fillTexture.debugDescription, node2.fillTexture.debugDescription)
        XCTAssert(node1.glowWidth == node2.glowWidth)
        XCTAssert(node2.glowWidth == node1.glowWidth)
        reflexiveAssertEqual(node1.path.debugDescription, node2.path.debugDescription)
        if node1.strokeColor.alphaComponent == 0 && node2.strokeColor.alphaComponent == 0 {
            XCTAssert(true)
        } else {
            reflexiveAssertEqual(node1.strokeColor.debugDescription, node2.strokeColor.debugDescription)
        }
        reflexiveAssertEqual(node1.strokeShader.debugDescription, node2.strokeShader.debugDescription)
        reflexiveAssertEqual(node1.strokeTexture.debugDescription, node2.strokeTexture.debugDescription)
        reflexiveAssertEqual(node1.frame.debugDescription, node2.frame.debugDescription)
    }
}
