/// built using logic similar to linked lists
public class Stack<T> {
    
    private var head: StackNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }

    public func push(_ value: T) {
        let new = StackNode(value: value)
        new.next = head
        head = new
    }

    public func pop() -> T? {
        let value = head
        head = head?.next
        return value?.value
    }
    
    public func peek() -> T? {
        return head?.value
    }
  
}

extension Stack: CustomStringConvertible {
    public var description: String {
        var result:[T] = []
        var node = head
        while node != nil {
            result.append(node!.value)
            node = node?.next
        }
        return result.description
    }
}

public class StackNode<T> {
    var value: T
    var next: StackNode<T>?
    init(value: T) {
        self.value = value
    }
}
