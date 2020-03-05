/*:
 # Heap Data Structure Challenges
 ## 1. Find the nth Smallest Integer
 Write a function to find the `nth` smallest integer in an unsorted array. For example:
 ```
  let integers = [3, 10, 18, 5, 21, 100]
  n = 3
 ```
 If  `n = 3`, the result should be `10`.
 */

// Time: O(n*logn)
func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
  var heap = Heap(sort: <, elements: elements) // O(n)
  var current = 1
  while !heap.isEmpty { // O(n)
    let element = heap.remove() // O(logn)
    if current == n {
      return element
    }
    current += 1
  }
  return nil
}

let elements = [3, 10, 18, 5, 21, 100]
let nthElement = getNthSmallestElement(n: 3, elements: elements)

//: [Next Challenge](@next)
