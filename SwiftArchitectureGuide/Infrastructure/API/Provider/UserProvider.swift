//
//  UserProvider.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 18/09/24.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func login(parameters: [AnyHashable: Any], completionHanlder: @escaping(Result<UserModel, Error>) -> Void)
    func register(parameters: [AnyHashable: Any], completionHanlder: @escaping(Result<UserModel, Error>) -> Void)
}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completionHanlder: @escaping (Result<UserModel, any Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHanlder(.failure(error))
            } else {
                completionHanlder(.success(userModel))
            }
        }
    }
    
    
    func register(parameters: [AnyHashable : Any], completionHanlder: @escaping (Result<UserModel, any Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel

        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHanlder(.failure(error))
            } else {
                completionHanlder(.success(userModel))
            }
        }
    }
    
}
