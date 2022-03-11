import UIKit

// Coleçoes de dados - Array


var fruit: [String] = ["Banana", "maça", "uva"]

// Metodos de append = push

fruit.append("goiaba")

fruit.insert("pera", at: 0)

// result = ["pera","Banana", "maça", "uva", "goiaba"]

fruit.removeLast()

fruit.removeFirst()

// result = ["Banana", "maça", "uva"]

fruit.removeAll()

// result = []

print(fruit)

// -----------------------------------

// metodo para saber quantos items tem no array

fruit.append("jaca")

var count = fruit.count

print(count)

// result = 1

// ------------------------------------

// typealias e tipo uma interface, para criar tipos persornalizado, exemplo:

typealias fruits = String









