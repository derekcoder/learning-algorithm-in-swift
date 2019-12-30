
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
  
  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
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
