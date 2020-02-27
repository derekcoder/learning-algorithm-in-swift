/*:
 [Previous Challenge](@previous)
 
 ## Challenge 2
 
 How many **nodes** are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height `h`?
*/

// Your code here

import Foundation

func nodes(inTreeOfHeight height: Int) -> Int {
  Int(pow(2.0, Double(height + 1))) - 1
}

nodes(inTreeOfHeight: 3)

//: [Next Challenge](@next)
