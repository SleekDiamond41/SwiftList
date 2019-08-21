import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {
	func testExample() {
		let a = Node("A")
		let b = Node("B")
		let c = Node("C")
		
		XCTAssertEqual(a.previous, nil)
		XCTAssertEqual(a.next, nil)
		XCTAssertEqual(b.previous, nil)
		XCTAssertEqual(b.next, nil)
		XCTAssertEqual(c.previous, nil)
		XCTAssertEqual(c.next, nil)
		
		XCTAssertEqual(a.count, 1)
		
		// MARK: -
		a.next = c
		
		XCTAssertEqual(a.previous, nil)
		XCTAssertEqual(a.next, c)
		XCTAssertEqual(b.previous, nil)
		XCTAssertEqual(b.next, nil)
		XCTAssertEqual(c.previous, a)
		XCTAssertEqual(c.next, nil)
		
		XCTAssertEqual(a.numberOfItemsBefore, 0)
		XCTAssertEqual(a.numberOfItemsAfter, 1)
		XCTAssertEqual(a.count, 2)
		XCTAssertEqual(b.numberOfItemsBefore, 0)
		XCTAssertEqual(b.numberOfItemsAfter, 0)
		XCTAssertEqual(b.count, 1)
		XCTAssertEqual(c.numberOfItemsBefore, 1)
		XCTAssertEqual(c.numberOfItemsAfter, 0)
		XCTAssertEqual(c.count, 2)
		
		// MARK: -
		c.previous = b
		
		XCTAssertEqual(a.previous, nil)
		XCTAssertEqual(a.next, b)
		XCTAssertEqual(b.previous, a)
		XCTAssertEqual(b.next, c)
		XCTAssertEqual(c.previous, b)
		XCTAssertEqual(c.next, nil)
		
		XCTAssertEqual(a.numberOfItemsBefore, 0)
		XCTAssertEqual(a.numberOfItemsAfter, 2)
		XCTAssertEqual(a.count, 3)
		XCTAssertEqual(b.numberOfItemsBefore, 1)
		XCTAssertEqual(b.numberOfItemsAfter, 1)
		XCTAssertEqual(b.count, 3)
		XCTAssertEqual(c.numberOfItemsBefore, 2)
		XCTAssertEqual(c.numberOfItemsAfter, 0)
		XCTAssertEqual(c.count, 3)
		
		// MARK: -
		c.previous = nil
		
		XCTAssertEqual(a.previous, nil)
		XCTAssertEqual(a.next, b)
		XCTAssertEqual(b.previous, a)
		XCTAssertEqual(b.next, nil)
		XCTAssertEqual(c.previous, nil)
		XCTAssertEqual(c.next, nil)
		
		XCTAssertEqual(a.numberOfItemsBefore, 0)
		XCTAssertEqual(a.numberOfItemsAfter, 1)
		XCTAssertEqual(a.count, 2)
		XCTAssertEqual(b.numberOfItemsBefore, 1)
		XCTAssertEqual(b.numberOfItemsAfter, 0)
		XCTAssertEqual(b.count, 2)
		XCTAssertEqual(c.numberOfItemsBefore, 0)
		XCTAssertEqual(c.numberOfItemsAfter, 0)
		XCTAssertEqual(c.count, 1)
	}
	
	func testIterator() {
		let a = Node("A")
		let b = Node("B")
		let c = Node("C")
		
		var count = 0
		for _ in a {
			count += 1
		}
		XCTAssertEqual(count, 1)
		
		a.next = b
		count = 0
		for _ in a {
			count += 1
		}
		XCTAssertEqual(count, 2)
		
		b.next = c
		count = 0
		for item in a {
			print(item)
			count += 1
		}
		XCTAssertEqual(count, 3)
	}
	
//	static var allTests = [
//		("testExample", testExample),
//	]
}
