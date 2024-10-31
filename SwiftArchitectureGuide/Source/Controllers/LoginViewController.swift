//
//  LoginViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

class LoginViewController: UIViewController {
   
    // MARK: Closures
    var navigateToHome: (() -> Void)?
    var navigateToRegister: (() -> Void)?

    
    // MARK: Properties
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.onTapLogin = self.onTapLogin
        view.onTapRegister = self.onTapRegister
        return view;
    }()
    
    
    // MARK: Overrides
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    
    // MARK: Functions
    private func onTapLogin(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.login(email, password) {[weak self] result in
            switch result {
            case .success(_):
                self?.navigateToHome?()
            case .failure(let error):
                self?.showAlert("Erro", error.localizedDescription)
            }
        }
    }
    
    private func onTapRegister() {
        self.navigateToRegister?()
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}
