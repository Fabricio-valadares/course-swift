//
//  ViewController.swift
//  imc-calculator
//
//  Created by Idwall Go Dev 012 on 12/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weigth: UITextField!
    @IBOutlet weak var heigth: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onPressButton(_ sender: Any) {
   
        if let myWeigth = NumberFormatter().number(from: weigth.text!),
           let myHeigth = NumberFormatter().number(from: heigth.text!)
        {
            let Weigth = myWeigth.floatValue
            let Heigth = myHeigth.floatValue
            print(Weigth)
            print(Heigth)
            let result = imc(massa: Weigth, altura: Heigth)
            
            let alert = UIAlertController(title: "Confira seu IMC", message: result, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            }))
            
            
            present(alert, animated: true, completion: nil)
            
            print(result)

          } else {
              print("Deu erro")
          }

    }
    
    func imc (massa: Float, altura: Float) -> String {
        let imc: Float = massa/(altura*altura)
        let imcFormated: String = String(format: "%.2f", imc)

        switch imc {
        case _ where imc < 18.5:
            return "\(imcFormated) - Você está abaixo do seu peso ideal"
        case _ where imc < 25:
            return "\(imcFormated) - Você está no seu peso ideal"
        case _ where imc < 30:
            return "\(imcFormated) - Você está com sobrepeso"
        case _ where imc < 35:
            return "\(imcFormated) - Você está com obesidade GRAU 1"
        case _ where imc < 40:
            return "\(imcFormated) - Você está com obesidade GRAU 2"
        case _ where imc >= 40:
            return "\(imcFormated) - Você está com obesidade GRAU 3"
        default:
            return "Error"
        }
    }
}

