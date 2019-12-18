//
//  Stack.swift
//
//  Created by Derek on 18/12/19.
//  Copyright © 2019 DerekCoder. All rights reserved.
//


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
    peek() == nil
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
