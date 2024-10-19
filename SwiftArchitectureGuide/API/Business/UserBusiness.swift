//
//  UserBusiness.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 19/09/24.
//

import Foundation

protocol UserBusinessProtocol {
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserBusiness: UserBusinessProtocol {
    lazy var provider = UserProvider()
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, any Error>) -> Void) {
        provider.login(parameters: getParams(email: email, password: password)) { result in
            switch result {
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, any Error>) -> Void) {
        provider.register(parameters: getParams(email: email, password: password)) { result in
            switch result {
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func getParams(email: String, password: String) -> [AnyHashable : Any] {
        let userModel = UserModel(email: email, password: password)
        let params: [AnyHashable : Any] = [Constants.ParametersKeys.body : [Constants.ParametersKeys.userModel : userModel]]
        return params
    }
}
