import UIKit

// class exemplo, class podem herdar

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


var boxRedFruits = BoxFruits(red: ["maça", "acerola"], orange: ["laranja", "caju"])

print(boxRedFruits.getListFruits(color: "red"))
print(boxRedFruits.getListFruits(color: "orange"))

// struct exemplo, struct nao podem herdar

struct BoxStructFruits {
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


var boxRedFruitsStruct =  BoxStructFruits(red: ["maça1", "acerola1"], orange: ["laranja1", "caju1"])

print(boxRedFruitsStruct.getListFruits(color: "red"))
print(boxRedFruitsStruct.getListFruits(color: "orange"))























