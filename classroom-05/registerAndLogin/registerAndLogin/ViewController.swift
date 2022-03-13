//
//  ViewController.swift
//  registerAndLogin
//
//  Created by FL00027 on 13/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func alertMessage(title: String, message: String, titleButton: String) {
        let alertError = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertError.addAction(UIAlertAction(title: titleButton, style: .default, handler: { action in }))
        
        
        present(alertError, animated: true, completion: nil)
    }


    @IBAction func handleSubmit(_ sender: Any) {
        
        guard email.text != "" else {
            return self.alertMessage(title: "Error", message: "Email e obrigatório", titleButton: "Ok")
        }
        
        guard password.text != "" else {
            return self.alertMessage(title: "Error", message: "Senha e obrigatório", titleButton: "Ok")
        }
        
        email.text = ""
        password.text = ""
        
        self.alertMessage(title: "Sucesso", message: "Parabéns seu login foi efetuado com sucesso !", titleButton: "Ok")
        
    }
    
}

