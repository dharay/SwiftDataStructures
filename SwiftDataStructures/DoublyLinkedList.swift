
open class DoublyLinkedList<T> {
    
    private var head: DoublyLinkedListNode<T>?
    private var tail: DoublyLinkedListNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }

    public var first: DoublyLinkedListNode<T>? {
        return head
    }

    public var last: DoublyLinkedListNode<T>? {
        return tail
    }

    public func append(value: T) {
        let newNode = DoublyLinkedListNode(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> DoublyLinkedListNode<T>? {
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
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: DoublyLinkedListNode<T>) {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return
    }

}

extension DoublyLinkedList where T:Equatable {
    public func removeFirstNode(withValue value: T) {
        var currNode = head
        if currNode == nil {
            return
        }
        if currNode?.value == value {
            removeAll()
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
    
    public func firstNode(withValue value: T) -> DoublyLinkedListNode<T>? {
        var currNode = head

        while currNode != nil {
            if currNode?.value == value {
                return currNode
            }
            currNode = currNode?.next
        }
        return nil
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var result:[T] = []
        var node = first
        while node != nil {
            result.append(node!.value)
            node = node?.next
        }
        return result.description
    }
}

public class DoublyLinkedListNode<T> {
    public var value: T
    public var next: DoublyLinkedListNode<T>?
    weak var previous: DoublyLinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

