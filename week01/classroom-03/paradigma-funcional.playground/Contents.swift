import UIKit

var arr = ["uva", "pera", "banana"]

arr.sorted() // ordena em ordem alfabetica.
arr.sort() // voce consegui controlar a ordem do items, ela pode se implementada com essa sintaxe:
arr.sort { (lhs: String, rhs: String) -> Bool in lhs < rhs }

arr.sorted(by: <) // descending

// ------------------------------

var arr1 = [1, 2, 3, 4, 5]

arr1.map({res in res + 1}) // [2, 3, 4, 5, 6]
arr1.map{ $0 + 1 } // [2, 3, 4, 5, 6]

arr1.filter({ res in res >= 3 })
arr1.filter { $0 >= 3 }

arr1.reduce(0, { $0 + $1 })
arr1.reduce(0, +)

