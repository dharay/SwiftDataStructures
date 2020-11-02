
open class LinkedList<T:Equatable> {
    
    private var head: LinkedListNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }

    public var first: LinkedListNode<T>? {
        return head
    }
    
    /// O(n)
    public var tail: LinkedListNode<T>? {
        var next = self.head
        if next == nil {
            return nil
        }
        while next?.next != nil {
            next = next?.next
        }
        return next
    }
    
    /// O(n)
    public func append(value: T) {
        let newNode = LinkedListNode(value: value)
        if head == nil {
            head = newNode
        } else {
            tail?.next = newNode
        }
    }
    
    public func nodeAt(index: Int) -> LinkedListNode<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func firstNode(withValue value: T) -> LinkedListNode<T>? {
        var currNode = head

        while currNode != nil {
            if currNode?.value == value {
                return currNode
            }
            currNode = currNode?.next
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
    }
    
    public func remove(node: LinkedListNode<T>) {
        var currNode = head
        if currNode == nil {
            return
        }
        while currNode?.next != nil {
            if Unmanaged.passUnretained((currNode?.next)!).toOpaque() == Unmanaged.passUnretained(node).toOpaque() {
                currNode?.next = node.next
                return
            }
            currNode = currNode?.next
        }
    }
    
    public func removeFirstNode(withValue value: T) {
        var currNode = head
        if currNode == nil {
            return
        }
        while currNode?.next != nil {
            if currNode?.next?.value == value {
                currNode?.next = currNode?.next?.next
                return
            }
            currNode = currNode?.next
        }
    }
}

public class LinkedListNode<T:Equatable> {
    
    public var value: T
    public var next: LinkedListNode<T>?
    
    public init(value: T) {
        self.value = value
    }
}

