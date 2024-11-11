//
//  LoginViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func navigateToHome() -> Void
    func navigateToRegister() -> Void
}

class LoginViewController: UIViewController {
    var delegate: LoginViewControllerDelegate?
    
    // MARK: Properties
    private lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.delegate = self
        return view;
    }()
    
    private var alertController: UIAlertController?

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    override func loadView() {
        self.view = loginView
    }
}

// MARK: LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func onTapLogin(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        self.showLoadingAlert()
        
        userViewModel.login(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.hideLoadingAlert() {
                    self?.delegate?.navigateToHome()
                }
            case .failure(let error):
                self?.hideLoadingAlert() {
                    self?.showErrorAlert("Something went wrong", error.localizedDescription)
                }
            }
        }
    }
    
    func onTapRegister() {
        self.delegate?.navigateToRegister()
    }
}

// MARK: UIAlertController
extension LoginViewController {
    private func showLoadingAlert() {
        self.alertController = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        
        self.alertController!.view.addSubview(loadingIndicator)
        self.present(self.alertController!, animated: true)
    }
    
    private func hideLoadingAlert(completion: @escaping(() -> Void)) {
        self.alertController?.dismiss(animated: true, completion: {completion()})
    }
    
    private func showErrorAlert(_ title: String, _ message: String) {
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.alertController!.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(self.alertController!, animated: true)
    }
}






