//
//  LoginPresenter.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 19/10/24.
//

import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func navigateToHome()
}


class LoginPresenter {
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: userModel.email, password: userModel.password) { userModel in
            self.delegate?.navigateToHome()
            } errorHandler: { error in
                self.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
            }
        }
    }
