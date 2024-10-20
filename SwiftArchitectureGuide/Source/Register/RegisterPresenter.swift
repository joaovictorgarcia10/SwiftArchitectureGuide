//
//  RegisterPresenter.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 19/10/24.
//

import Foundation

protocol RegisterPresenterDelegate {
    func showMessage(title: String, message: String)
    func navigateToHome()
}

class RegisterPresenter {
    var delegate: RegisterPresenterDelegate?

    func register(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: userModel.email, password: userModel.password) { userModel in
            self.delegate?.navigateToHome()
            } errorHandler: { error in
                self.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
            }
        }
    }
