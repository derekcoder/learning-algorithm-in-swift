
public struct QueueArray<T>: Queue {
  private var storage: [T] = []
  
  public init() {}
  
  public mutating func enqueue(_ element: T) -> Bool {
    storage.append(element)
    return true
  }
  
  @discardableResult
  public mutating func dequeue() -> T? {
    storage.isEmpty ? nil : storage.removeFirst()
  }
  
  public var peek: T? {
    storage.first
  }
  
  public var isEmpty: Bool {
    storage.isEmpty
  }
}

extension QueueArray: CustomStringConvertible {
  public var description: String {
    guard !isEmpty else {
      return "Empty queue"
    }
    return "⭠ \(storage.reversed().map { "\($0)" }.joined(separator: " ")) ⭠"
  }
}

example(of: "using queue") {
  var queue = QueueArray<String>()
  queue.enqueue("Ray")
  queue.enqueue("Brian")
  queue.enqueue("Eric")
  
  print(queue)
  queue.dequeue()
  print(queue)
  queue.peek
  print(queue)
}
