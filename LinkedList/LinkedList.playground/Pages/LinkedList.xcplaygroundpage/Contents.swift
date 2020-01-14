
public class Node<Value> {
  public var value: Value
  public var next: Node<Value>?
  
  init(value: Value, next: Node<Value>? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> \(next) "
  }
}

public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  var isEmpty: Bool {
    head == nil
  }
  
  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  public mutating func append(_ value: Value) {
    guard !isEmpty else {
      push(value)
      return
    }
    
    tail?.next = Node(value: value)
    tail = tail?.next
  }
  
  public func node(at index: Int) -> Node<Value>? {
    var currentNode = head
    var currentIndex = 0
    
    while currentNode != nil && currentIndex < index {
      currentNode = currentNode!.next
      currentIndex += 1
    }
    
    return currentNode
  }
  
  public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
    node.next = Node(value: value, next: node.next)
    
    if tail === node {
      tail = node.next
    }
    
    return node.next!
  }
  
  @discardableResult
  public mutating func pop() -> Value? {
    defer {
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    
    return head?.value
  }
  
  public mutating func removeLast() -> Value? {
    guard let head = head else {
      return nil
    }
    guard head.next != nil else {
      return pop()
    }
    
    var prev = head
    var current = head
    
    while let next = current.next {
      prev = current
      current = next
    }
    
    prev.next = nil
    tail = prev
    
    return current.value
  }
  
  public mutating func remove(after node: Node<Value>) -> Value? {
    defer {
      if node.next === tail {
        tail = node
      }
      node.next = node.next?.next
    }
    return node.next?.value
  }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return "\(head)"
  }
}

example(of: "push") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print(list)
}

example(of: "append") {
  var list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  
  print(list)
}

example(of: "inserting at a particular index") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("Before inserting: \(list)")
  var middleNode = list.node(at: 1)!
  for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}

example(of: "pop") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before popping list: \(list)")
  let poppedValue = list.pop()
  print("After popping list: \(list)")
  print("Popped value: \(poppedValue)")
}

example(of: "removing the last node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before removing last node: \(list)")
  let removedValue = list.removeLast()
  print("After removing last node: \(list)")
  print("Removed value: \(removedValue)")
}

example(of: "removing a node after a particular node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before removing at particular index: \(list)")
  let index = 1
  let node = list.node(at: index - 1)!
  let removedNode = list.remove(after: node)
  print("After removing at index \(index): \(list)")
}
