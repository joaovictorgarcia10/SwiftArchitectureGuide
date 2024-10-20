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
    
    let presenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func onTapLoginButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            let userModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
}


extension LoginViewController: LoginPresenterDelegate {
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    
    func navigateToHome() {
        self.performSegue(withIdentifier: "LoginToHomeSegue", sender: self)
    }
}
