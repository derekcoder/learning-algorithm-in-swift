
public struct Stack<Element> {
  private var storage: [Element] = []
  
  public init() {}
  
  public init(_ elements: [Element]) {
    storage = elements
  }
  
  public mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  @discardableResult
  public mutating func pop() -> Element? {
    storage.popLast()
  }
  
  public func peek() -> Element? {
    storage.last
  }
  
  public var isEmpty: Bool {
    storage.isEmpty
  }
}

extension Stack: CustomStringConvertible {
  public var description: String {
    """
    ---- top ----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -------------
    """
  }
}

extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}

example(of: "using a stack") {
  var stack = Stack<Int>()
  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)
  
  print(stack)
  
  if let poppedElement = stack.pop() {
    assert(poppedElement == 4)
    print("Popped: \(poppedElement)")
  }
}

/*
 Challenge 1: Reverse an Array
 
 Create a function that prints the contents of an array in reversed order.
 
 */

let array: [Int] = [1, 2, 3, 4, 5]

func printInReverseArray<T>(_ array: [T]) {
  var stack = Stack(array)
  
  while let element = stack.pop() {
    print(element)
  }
}

printInReverseArray(array)

/*
 Challenge 2: Balance the parentheses
 
 Check for balanced parentheses. Given a string, check if there are ( and ) characters,
 and return true if the parentheses in the string are balanced,
 and return false if not.
 
 h((e))llo(world)() // balanced parentheses
 (hello world // unbalanced parentheses
 
 */

var testString1 = "h((e))llo(world)()"
var testString2 = "(hello world"

func checkParentheses(_ string: String) -> Bool {
  var stack = Stack<Character>()
  
  for character in string {
    if character == "(" {
      stack.push(character)
    } else if character == ")" {
      if stack.isEmpty {
        return false
      } else {
        stack.pop()
      }
    }
  }
  
  return stack.isEmpty
}

checkParentheses(testString1) // should be true
checkParentheses(testString2) // should be false


