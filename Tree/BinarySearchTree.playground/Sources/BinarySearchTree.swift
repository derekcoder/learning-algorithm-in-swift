import Foundation

public struct BinarySearchTree<T: Comparable> {
  
  public private(set) var root: BinaryNode<T>?
  
  public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    guard let root = root else {
      return "empty tree"
    }
    return "\(root)"
  }
}

extension BinarySearchTree {
  // Time: O(log n)
  public mutating func insert(_ value: T) {
    root = insert(from: root, value: value)
  }
  
  private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
    // 
    guard let node = node else {
      return BinaryNode(value: value)
    }
    
    if value < node.value {
      node.leftChild = insert(from: node.leftChild, value: value)
    } else {
      node.rightChild = insert(from: node.rightChild, value: value)
    }
    
    return node
  }
  
  // Time: O(log n)
  public func contains(_ value: T) -> Bool {
    var current = root
      
    while let node = current {
      if node.value == value {
        return true
      }
      
      if value < node.value {
        current = node.leftChild
      } else {
        current = node.rightChild
      }
    }
    return false
  }
  
  public mutating func remove(_ value: T) {
    root = remove(node: root, value: value)
  }
  
  private func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
    guard let node = node else {
      return nil
    }
    
    if value == node.value {
      if node.leftChild == nil && node.rightChild == nil {
        return nil
      }
      
      if node.leftChild == nil {
        return node.rightChild
      }
      
      if node.rightChild == nil {
        return node.leftChild
      }
      
      node.value = node.rightChild!.min.value
      node.rightChild = remove(node: node.rightChild, value: node.value)
    } else if value < node.value {
      node.leftChild = remove(node: node.leftChild, value: value)
    } else {
      node.rightChild = remove(node: node.rightChild, value: value)
    }
    
    return node
  }
}

private extension BinaryNode {
  var min: BinaryNode {
    leftChild?.min ?? self
  }
}
