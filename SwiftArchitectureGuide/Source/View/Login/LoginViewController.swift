//
//  LoginViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

protocol LoginViewControllerDelegate {
    func navigateToHome() -> Void
    func navigateToRegister() -> Void
}

class LoginViewController: UIViewController {
    var delegate: LoginViewControllerDelegate?
    
    // MARK: View
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.delegate = self
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
}

// MARK: LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func onTapLogin(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.login(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.navigateToHome()
            case .failure(let error):
                self?.showAlert("Erro", error.localizedDescription)
            }
        }
    }
    
    func onTapRegister() {
        self.delegate?.navigateToRegister()
    }
}

// MARK: Alert Functions
extension LoginViewController {
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}






