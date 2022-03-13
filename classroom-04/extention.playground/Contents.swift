import UIKit

// extension

var greeting = "Hello, playground"class BoxFruits {
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


var boxRedFruits = BoxFruits(red: ["maça", "acerola"], orange: ["laranja", "caju"])

print(boxRedFruits.getListFruits(color: "red"))
print(boxRedFruits.getListFruits(color: "orange"))
