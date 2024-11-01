//
//  RegisterViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

protocol RegisterViewControllerDelegate {
    func navigateToHome() -> Void
}

class RegisterViewController: UIViewController {
    var delegate: RegisterViewControllerDelegate?
    
    // MARK: Properties
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        view.delegate = self
        return view;
    }()
    
    // MARK: Overrides
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
    }
}

// MARK: RegisterViewDelegate
extension RegisterViewController: RegisterViewDelegate {
     func onTapRegister(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.register(email, password) {[weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.navigateToHome()
            case .failure(let error):
                self?.showAlert("Erro", error.localizedDescription)
            }
        }
    }
    
    func showPasswordsNotMatchAlert(_ title: String, _ message: String) {
        self.showAlert(title, message)
    }
}

// MARK: Functions
extension RegisterViewController {
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}
