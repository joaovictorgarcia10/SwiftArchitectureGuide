//
//  LoginCoordinator.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import Foundation
import UIKit


class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { 
        let viewController = LoginViewController()
                
        viewController.navigateToRegister = {
            let registerCoordinator = RegisterCoordinator(navigationController: self.navigationController)
            registerCoordinator.start()
        }
        
        viewController.navigateToHome = {
            let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
            homeCoordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
