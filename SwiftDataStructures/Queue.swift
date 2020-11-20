/// built using logic similar to linked lists
public class Queue<T> {
    
    private var head: QueueNode<T>?
    private var tail: QueueNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    public func removeAll() {
        head = nil
        tail = nil
    }

    public func enqueue(_ value: T) {
        let new = QueueNode(value: value)
        head?.previous = new
        new.next = head
        
        head = new
        
        if tail == nil {
            tail = new
        }
    }

    public func dequeue() -> T? {

        let value = tail
        if let previous = tail?.previous {
            tail = previous
        } else {
            //last element
            head = nil
        }
        tail?.next = nil
        return value?.value
    }
    
    public func peek() -> T? {
        return tail?.value
    }
  
}

extension Queue: CustomStringConvertible {
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

public class QueueNode<T> {
    var value: T
    var next: QueueNode<T>?
    weak var previous: QueueNode<T>?
    init(value: T) {
        self.value = value
    }
}
