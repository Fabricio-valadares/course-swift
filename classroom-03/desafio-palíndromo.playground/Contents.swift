import UIKit

func verifyPalindromo(value: String) -> Bool {
    
    let newOrder = String(value.reversed())
        
    guard newOrder == value else {
     return false
    }
    
    return true
}

print(verifyPalindromo(value: "osso"))
