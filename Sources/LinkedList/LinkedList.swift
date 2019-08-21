import Foundation

public class Node<Element> {
	public let item: Element
	
	private var _previous: Node?
	private var _next: Node?
	
	public init(_ item: Element) {
		self.item = item
	}
}

extension Node {
	
	public var previous: Node? {
		get {
			return _previous
		}
		set {
			newValue?._previous = _previous
			newValue?._next = self
			_previous?._next = newValue
			self._previous = newValue
		}
	}
	
	public var next: Node? {
		get {
			return _next
		}
		set {
			newValue?._previous = self
			newValue?._next = _next
			_next?._previous = newValue
			self._next = newValue
		}
	}
	
	public var isFirst: Bool {
		return previous == nil
	}
	
	public var isLast: Bool {
		return next == nil
	}
	
	/// The total number of nodes in the list.
	///
	/// - Complexity: O(n), where `n` is the number of items in the list. Duh.
	public var count: Int {
		return numberOfItemsBefore + numberOfItemsAfter + 1
	}
	
	public var numberOfItemsBefore: Int {
		guard let p = _previous else {
			return 0
		}
		return p.numberOfItemsBefore + 1
	}
	
	public var numberOfItemsAfter: Int {
		guard let n = _next else {
			return 0
		}
		return n.numberOfItemsAfter + 1
	}
}

extension Node: Sequence {
	
	public func makeIterator() -> Node<Element>.Iterator {
		return Iterator(current: self)
	}
	
	public struct Iterator: IteratorProtocol {
		private var current: Node?
		
		fileprivate init(current: Node) {
			self.current = current
		}
		
		public mutating func next() -> Element? {
			defer {
				self.current = current?.next
			}
			return current?.item
		}
	}
}

extension Node: Equatable where Element: Equatable {
	public static func == (left: Node, right: Node) -> Bool {
		return left.item == right.item
	}
}
