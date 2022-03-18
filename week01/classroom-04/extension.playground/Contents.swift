import UIKit

// extension

class BoxFruits {
    private var red: [String]
    private var orange: [String]
    
    init (red: [String], orange: [String]) {
        self.red = red
        self.orange = orange
    }
    
    func getListFruits(color: String) -> [String] {
        if color == "red" {
            return self.red
        }
        
        return self.orange
    }
}

extension BoxFruits {
    func getFruitRed() -> [String] {
        return self.red
    }
}


var boxRedFruits = BoxFruits(red: ["maça", "acerola"], orange: ["laranja", "caju"])

print(boxRedFruits.getListFruits(color: "red"))
print(boxRedFruits.getListFruits(color: "orange"))

print(boxRedFruits.getFruitRed())

// protocal

protocol Person {
   func getName() -> String
}

class PersonClass: Person {
    
    var name: String = "gustavo"
    
    func getName() -> String {
        return self.name
    }
}

var personExample = PersonClass()

print(personExample.getName())

// Exemplo de extension em UIColor

extension UIColor {
    static let yellowFabricio = UIColor(red: 0.89, green: 0.55, blue: 0.20, alpha: 1.0)
}

var color = UIColor.yellowFabricio

var color1 = #colorLiteral(red: 0.89, green: 0.55, blue: 0.20, alpha: 1.0)

