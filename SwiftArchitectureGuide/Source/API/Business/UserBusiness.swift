//
//  UserBusiness.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 19/09/24.
//

import Foundation

protocol UserBusinessProtocol: AnyObject {
    func register(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func logout(completionHandler: @escaping(Result<Void, Error>) -> Void)
    func getUserData(completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserBusiness: UserBusinessProtocol {
    lazy var provider = UserProvider()
    
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
    
    func logout(completionHandler: @escaping (Result<Void, any Error>) -> Void) {
        provider.logout() { result in
            switch result {
            case .success():
                completionHandler(.success(()))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func getUserData(completionHandler: @escaping (Result<UserModel, any Error>) -> Void) {
        provider.getUserData() { result in
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
        let params: [AnyHashable : Any] = [K.ParametersKeys.body : [K.ParametersKeys.userModel : userModel]]
        return params
    }
}
