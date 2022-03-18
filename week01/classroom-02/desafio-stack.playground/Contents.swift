import UIKit

protocol StackFactory {
    func addItemInStack(value: Any) -> [Any]
    func removeItemInStack() -> [Any]
    func removeAllItemsInStack() -> [Any]
}

class Stack: StackFactory {
    var stack: [Any] = []
    
    func addItemInStack(value: Any) -> [Any] {
        stack.insert(value, at: 0)
        
        return stack
    }
    
    func removeItemInStack() -> [Any] {
        stack.removeFirst()
        
        return stack
    }
    
    func removeAllItemsInStack() -> [Any] {
        stack.removeAll()
        
        return stack
    }
}

var stackOne = Stack()

stackOne.addItemInStack(value: "Item-1")
stackOne.addItemInStack(value: "Item-2")
stackOne.addItemInStack(value: "Item-3")

print(stackOne.stack) // ["Item-3", "Item-2", "Item-1"]

stackOne.removeItemInStack()

print(stackOne.stack) // ["Item-2", "Item-1"]

stackOne.removeAllItemsInStack()

print(stackOne.stack) // []



















