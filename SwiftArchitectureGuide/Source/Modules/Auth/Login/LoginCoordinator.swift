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
        self.navigationController.pushViewController(LoginViewController(), animated: true)
    }
}
