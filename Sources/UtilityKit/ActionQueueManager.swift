#if !os(Linux)
import Foundation
import SpriteKit

/// A class that manages a queue of SKActions to run on a specified SKNode.
public class ActionQueueManager {
    /// The node on which to perform the queue of actions.
    public let node: SKNode
    /// The queue of actions that will be run on the node.
    private var queue: [SKAction] = []
    /// Whether the node is currently running an action.
    public private(set) var isRunning = false
    
    /// Creates a new ActionQueueManager to manage actions for the specified node.
    ///
    /// - Parameter node: The node to manage actions for.
    public init(node: SKNode) {
        self.node = node
    }
    
    /// Adds an action to the queue of actions to be performed.
    ///
    /// - Parameter action: The action to add to the end of the queue.
    public func addAction(_ action: SKAction) {
        queue.append(action)
        if !isRunning {
            queue.append(action)
            actionCompleted()
            removeAction(action)
        }
    }
    
    /// Removes and returns an action from the queue if it is there. This method will not remove an action that is currently running.
    ///
    /// - Parameter action: The action to remove from the queue.
    /// - Returns: The action that was removed, or `nil` if it wasn't in the queue.
    @discardableResult func removeAction(_ action: SKAction) -> SKAction? {
        if let index = queue.index(of: action) {
            return queue.remove(at: index)
        }
        return nil
    }
    
    /// A method called every time the node finishes running an action. This method is only called if the ActionQueueManager was used to start the action.
    private func actionCompleted() {
        isRunning = false
        queue.remove(at: 0)
        if !queue.isEmpty {
            node.run(queue[0], completion: self.actionCompleted)
            isRunning = true
        }
    }
}
#endif
