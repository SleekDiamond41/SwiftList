import Foundation

public class Node<Element> {
    public let item: Element

    private var _previous: Node?
    private var _next: Node?

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
            _next?.previous = newValue
            self._next = newValue
        }
    }

    public init(_ item: Element) {
        self.item = item
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
        guard let previous = _previous else {
            return 0
        }
        return previous.numberOfItemsBefore + 1
    }

    public var numberOfItemsAfter: Int {
        guard let next = _next else {
            return 0
        }
        return next.numberOfItemsAfter + 1
    }
}

extension Node: Sequence {

    public func makeIterator() -> Node<Element>.Iterator {
        return Iterator(current: self)
    }

    public struct Iterator: IteratorProtocol {
        private var current: Node

        fileprivate init(current: Node) {
            self.current = current
        }

        public mutating func next() -> Element? {
            guard let next = current.next else {
                return nil
            }
            return next.item
        }
    }
}


let a = Node("A")
let b = Node("B")
let c = Node("C")
let d = Node("D")

a.previous === nil
a.next === nil
b.previous === nil
b.next === nil
c.previous === nil
c.next === nil
d.previous === nil
d.next === nil

// MARK: -
d.previous = c
a.next = c

a.previous === nil
a.next === c
b.previous === nil
b.next === nil
c.previous === a
c.next === nil

// MARK: -
c.previous = b

a.previous === nil
a.next === b
b.previous === a
b.next === c
c.previous === b
c.next === nil

// MARK: -
c.previous = nil

a.previous === nil
a.next === b
b.previous === a
b.next === nil
c.previous === nil
c.next === nil

