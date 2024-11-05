//
//  HomeCoordinator.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeTabBarController()
        viewController.homeTabBarControllerDelegate = self
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
    }
}

// MARK: HomeTabBarControllerDelegate
extension HomeCoordinator: HomeTabBarControllerDelegate {
    func navigateToLogin() -> Void {
        self.navigationController.dismiss(animated: true)
    }
}
