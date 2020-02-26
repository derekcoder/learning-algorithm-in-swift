/*:
 # Binary Search Tree Challenges
 ### #1. Binary Tree or Binary Search Tree?
 
 Create a function that checks if a binary tree is a binary search tree.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

// Your solution here
extension BinaryNode where T:Comparable {
  var isBinarySearchTree: Bool {
    isBST(self, min: nil, max: nil)
  }
  
  private func isBST(_ tree: BinaryNode<T>?, min: T?, max: T?) -> Bool {
    guard let tree = tree else {
      return true
    }
    
    if let min = min, tree.value <= min {
      return false
    } else if let max = max, tree.value > max {
      return false
    }
    
    return isBST(tree.leftChild, min: min, max: tree.value) && isBST(tree.rightChild, min: tree.value, max: max)
  }
}

print(bst.root!.isBinarySearchTree)
//: [Next Challenge](@next)

