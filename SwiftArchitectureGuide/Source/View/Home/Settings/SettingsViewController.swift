//
//  SettingsViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 03/11/24.
//

import UIKit

class SettingsViewController: UIViewController {
    var navigateToLogin: (() -> Void)?
    
    // MARK: Properties
    private let userViewModel = UserViewModel()

    private var alertController: UIAlertController?
    
    private lazy var settingsView: SettingsView = {
        let view = SettingsView(frame: .zero)
        view.delegate = self
        return view
    }()
    

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.initValues()
    }
    
    override func loadView() {
        self.view = settingsView
    }
}

// MARK: SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
    func onTapLogout() {
        showLogoutAlert {
            self.userViewModel.logout { result in
                switch result {
                case .success(_):
                    self.navigateToLogin?()
                case .failure(let error):
                    self.showTryAgainAlert("Erro", error.localizedDescription)
                }
            }
        }
    }

    func initEmail() -> String? {
        var email: String?
        
        self.userViewModel.getUserData { result in
            switch result {
            case .success(let userData):
                email = userData.email
            case .failure(_):
                email = nil
            }
        }
        
        return email
    }
}

// MARK: UIAlertController
extension SettingsViewController {
    private func showLogoutAlert(confirmHandler: @escaping(() -> Void) ) {
        self.alertController = UIAlertController(title: "Atenção", message: "Quer mesmo sair da sua conta?", preferredStyle: .alert)
        self.alertController!.addAction(UIAlertAction(title: "Sim", style: .default, handler: { _ in confirmHandler()}))
        self.alertController!.addAction(UIAlertAction(title: "Não", style: .default))
        self.present(self.alertController!, animated: true)
    }
    
    private func showTryAgainAlert(_ title: String, _ message: String) {
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.alertController!.addAction(UIAlertAction(title: "Tentar novamente", style: .default))
        self.present(self.alertController!, animated: true)
    }
}
