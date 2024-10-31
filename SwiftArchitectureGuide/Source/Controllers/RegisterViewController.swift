//
//  RegisterViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: Closures
    var navigateToHome: (() -> Void)?

    // MARK: Properties
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        view.onTapRegister = self.onTapRegister
        view.showPasswordsNotMatchAlert = self.showAlert
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
        
    // MARK: Functions
    private func onTapRegister(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.register(email, password) {[weak self] result in
            switch result {
            case .success(_):
                self?.navigateToHome?()
            case .failure(let error):
                self?.showAlert("Erro", error.localizedDescription)
            }
        }
    }

    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}
