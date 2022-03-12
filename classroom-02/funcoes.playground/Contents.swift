import UIKit

// para funcoes a palavra chave e func
// um patrao legal para ser seguido e nao passar de 40 caractere nod paramentro das funcoes

// sintaxe padrao
func getText() {}

// tipamos as funcoes assim
func getText1() -> String { "" }

// pode retonar direto o valor quando e curto a funcionalidade
func getText2() {return}

// podemos criar um typealias para descrever melhor o retono das funcoes

typealias tuplaStringAndInt = (String, Int)

func getText3() -> tuplaStringAndInt { ("Text", 20) }

var result = getText3()

print(result)

// -------------------------------

// posso deixar um paramentro oculto com o _

func getText4(_ name: String) -> String { name }

var res = getText4("carlos")

print(res)

// --------------------------------


// funcao dentro de funcao

func getInt(_ value: Int, _ onCompletion: (Int) -> Void, onCompletion2: (String) -> String) -> String {
    onCompletion(value)
    let res = onCompletion2("gent boa: ")
    
    return "\(value), \(res)"
}

var resFinal: String = getInt(22) { res in
   print(res)
} onCompletion2: { res1 in
    print("\(res1)Boa")
    return res1
}

print(resFinal)






















