//
//  UserManager.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 19/09/24.
//

import Foundation

protocol UserManagerProtocol {
    func register (
        email: String,
        password: String,
        successHandler: @escaping(UserModel) -> Void,
        errorHandler: @escaping(Error) -> Void
    )
    
    func login (
        email: String,
        password: String,
        successHandler: @escaping(UserModel) -> Void,
        errorHandler: @escaping(Error) -> Void
    )
}

class UserManager: UserManagerProtocol {
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    
    func register (
        email: String,
        password: String,
        successHandler: @escaping (UserModel) -> Void,
        errorHandler: @escaping (Error) -> Void
    ) {
            business.register(email: email, password: password) { result in
                switch result {
                case .success(let userModel):
                    successHandler(userModel)
                case .failure(let error):
                    errorHandler(error)
                }
            }
        }
    
    
    func login(
        email: String,
        password: String,
        successHandler: @escaping (UserModel) -> Void,
        errorHandler: @escaping (any Error) -> Void
    ) {
        business.login(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
