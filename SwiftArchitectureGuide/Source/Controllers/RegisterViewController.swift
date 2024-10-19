//
//  RegisterViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 17/10/24.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var textFieldDelegate: UITextFieldDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate = self
    }
    

    @IBAction func onTapRegisterButton(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if password != confirmPassword {
                self.showMessage(title: "Erro", message: "As senhas não conferem")
            } else {
                let manager = UserManager(business: UserBusiness())
                
                manager.register(email: email, password: password) { userModel in
                    self.performSegue(withIdentifier: "RegisterToHomeSegue", sender: self)
                } errorHandler: { error in
                    self.showMessage(title: "Erro ao registrar usuário", message: error.localizedDescription)
                }
            }
        }
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
}


extension RegisterViewController: UITextFieldDelegate {}
