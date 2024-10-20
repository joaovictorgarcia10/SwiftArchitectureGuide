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
    
    let presenter = RegisterPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    

    @IBAction func onTapRegisterButton(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if password == confirmPassword {
                let userModel = UserModel(email: email, password: password)
                presenter.register(userModel: userModel)
            } else {
                showMessage(title: "Erro", message: "As senhas não conferem")
            }
        }
    }
}


extension RegisterViewController: RegisterPresenterDelegate {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    
    func navigateToHome() {
        self.performSegue(withIdentifier: "RegisterToHomeSegue", sender: self)
    }
}
