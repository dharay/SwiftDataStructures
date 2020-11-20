//
//  SwiftDataStructuresTests.swift
//  SwiftDataStructuresTests
//
//  Created by Mistry, Dharay Paresh on 29/10/20.
//

import XCTest
@testable import SwiftDataStructures

class SwiftDataStructuresTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLinkedList() throws {
        let list = LinkedList<Int>()
        list.append(value: 4)
        list.append(value: 3)
        let node = LinkedListNode(value: 8)
        list.tail?.next = node
        XCTAssert(list.tail?.value == 8)
        
        // should fail since node is not present in list and is created
        list.remove(node: LinkedListNode<Int>(value: 4))
        
        list.remove(node: node)
        XCTAssert(list.first?.value == 4)
        XCTAssert(list.tail?.value == 3)
    }
    
    func testDoublyLinkedList() throws {
        let list = DoublyLinkedList<Int>()
        list.append(value: 5)
        list.append(value: 2)
        XCTAssert(list.first?.value == 5)
        list.removeFirstNode(withValue: 5)
        XCTAssert(list.first?.value == 2)
        XCTAssert(!list.isEmpty)
        list.removeFirstNode(withValue: 2)
        XCTAssert(list.isEmpty)
        
    }
    
    func testStack() throws {
        let stack = Stack<Int>()
        stack.push(2)
        let two = stack.pop()
        XCTAssert(two == 2)
        XCTAssert(stack.pop() == nil)
        stack.push(5)
        stack.push(7)
        XCTAssert(stack.pop() == 7)
    }
    
    func testQueue() throws {
        let q = Queue<Int>()
        q.enqueue(5)
        q.enqueue(2)
        print(q.description)
        XCTAssert(q.dequeue() == 5)
        print(q.description)
        XCTAssert(q.dequeue() == 2)
        XCTAssert(q.isEmpty)
        
    }

}
