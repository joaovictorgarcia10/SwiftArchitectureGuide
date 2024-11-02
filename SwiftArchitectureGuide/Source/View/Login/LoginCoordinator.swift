//
//  LoginCoordinator.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { 
        let viewController = LoginViewController()
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: LoginViewControllerDelegate
extension LoginCoordinator: LoginViewControllerDelegate {
    func navigateToRegister() -> Void {
        let registerCoordinator = RegisterCoordinator(navigationController: self.navigationController)
        registerCoordinator.start()
    }
    
    func navigateToHome() -> Void {
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        homeCoordinator.start()
    }
}
