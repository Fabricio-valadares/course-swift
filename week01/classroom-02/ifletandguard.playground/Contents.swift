import UIKit

func printText(text: String?) -> String {
    
    // guard ja aborta na linha que ele foi implementado
    guard let text = text else {
        return "text nao foi passado"
    }
    
    return text
}

let result: String = printText(text: "uva")

print(result)

// --------------------------

func printText2(text: String?) -> String {
    
    // o if let continua a execucao.
    if let text = text {
        return "text foi passado: \(text)"
    }
    
    return "default"
}

let result2: String = printText2(text: "goiaba")

print(result2)
