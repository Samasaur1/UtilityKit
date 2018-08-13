import XCTest
import SpriteKit
@testable import UtilityKit

final class ActionQueueManagerTests: XCTestCase {
    var node: SKNode! = nil
    var aqm: ActionQueueManager! = nil
    override func setUp() {
        super.setUp()
        node = SKNode()
        aqm = ActionQueueManager(node: node)
    }
    override func tearDown() {
        super.tearDown()
        node = nil
        aqm = nil
    }
    func testNodeEquality() {
        XCTAssert(aqm.node == node)
    }
    
    
    static var allTests = [
        ("testNodeEquality", testNodeEquality),
    ]
}
