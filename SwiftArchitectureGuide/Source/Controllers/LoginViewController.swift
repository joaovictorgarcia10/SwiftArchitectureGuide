//
//  LoginViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 17/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var textFieldDelegate: UITextFieldDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate = self
    }
    
    @IBAction func onTapLoginButton(_ sender: UIButton) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            manager.login(email: email, password: password) { userModel in
                self.performSegue(withIdentifier: "LoginToHomeSegue", sender: self)
            } errorHandler: { error in
                self.showMessage(title: "Erro ao realizar o login", message: error.localizedDescription)
            }
        }
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
}


extension LoginViewController: UITextFieldDelegate {}
