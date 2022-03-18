import UIKit

// switch um estrutura de condicao

var fruit = "banana"

switch fruit {
    case "uva":
        print("posso fazer vinho")
    case "banana":
        print("posso fazer uma vitamina")
    case "goiaba":
        print("posso fazer um suco")
    default:
        print("nao consigo fazer nada com essa fruta: \(fruit)")
}

// se o nosso switch receber um numero eu posso usar o range: 1...5

// -------------------------------

// temos tambem os enum

enum FruitRed: String {
    case morango
    case maca
    case acerola = "acerola value"
}

print(FruitRed.maca) // maca

let fruits = FruitRed.morango

switch fruits {
    case .morango:
        print("fruta: \(fruits)")
    case .acerola:
        print("fruta: \(fruits)")
    case .maca:
        print("fruta: \(fruits)")
}

// acessar um valor no enum:

print(FruitRed.acerola.rawValue) // "acerola value"










































