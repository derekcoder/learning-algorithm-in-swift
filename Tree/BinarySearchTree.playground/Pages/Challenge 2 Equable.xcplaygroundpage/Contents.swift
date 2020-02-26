/*:
 [Previous Challenge](@previous)
 ### #2. Equatable
 The binary search tree currently lacks `Equatable` conformance. Your challenge is to conform adopt the `Equatable` protocol.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(4)

print(bst2)

// Are bst1 and bst2 equal?
// Your solution here
extension BinarySearchTree: Equatable {
  static public func ==(lhs: BinarySearchTree, rhs: BinarySearchTree) -> Bool {
    isEqual(lhs.root, rhs.root)
  }
  
  private static func isEqual<T: Equatable>(_ node1: BinaryNode<T>?, _ node2: BinaryNode<T>?) -> Bool {
    guard let leftNode = node1, let rightNode = node2 else {
      return node1 == nil && node2 == nil
    }
    
    return leftNode.value == rightNode.value &&
      isEqual(leftNode.leftChild, rightNode.leftChild) &&
      isEqual(leftNode.rightChild, rightNode.rightChild)
  }
}

bst == bst2
