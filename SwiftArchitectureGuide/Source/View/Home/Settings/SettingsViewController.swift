//
//  SettingsViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 03/11/24.
//

import UIKit

class SettingsViewController: UIViewController {
    var navigateToLogin: (() -> Void)?
    
    // MARK: View
    lazy var settingsView: SettingsView = {
        let view = SettingsView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    // MARK: Overrides
    override func loadView() {
        super.loadView()
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
    func onTapLogout() {
        let userViewModel = UserViewModel()
        
        showLogoutAlert {
            userViewModel.logout { result in
                switch result {
                case .success(_):
                    self.navigateToLogin?()
                case .failure(let error):
                    self.showTryAgainAlert("Erro", error.localizedDescription)
                }
            }
        }
    }
}

// MARK: Alert Functions
extension SettingsViewController {
    private func showLogoutAlert(confirmHandler: @escaping(() -> Void) ) {
        let alert = UIAlertController(title: "Atenção", message: "Quer mesmo sair da sua conta?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { _ in confirmHandler()}))
        alert.addAction(UIAlertAction(title: "Não", style: .default))
        self.present(alert, animated: true)
    }
    
    private func showTryAgainAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default))
        self.present(alert, animated: true)
    }
}
