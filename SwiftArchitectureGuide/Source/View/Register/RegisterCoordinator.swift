//
//  RegisterCoordinator.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

class RegisterCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: RegisterViewControllerDelegate
extension RegisterCoordinator: RegisterViewControllerDelegate {
    func navigateToHome() -> Void {
        navigationController.popToRootViewController(animated: false)
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        homeCoordinator.start()
    }
}
