//
//  UserProvider.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 18/09/24.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func register(parameters: [AnyHashable: Any], completionHanlder: @escaping(Result<UserModel, Error>) -> Void)
    func login(parameters: [AnyHashable: Any], completionHanlder: @escaping(Result<UserModel, Error>) -> Void)
    func logout(completionHanlder: @escaping(Result<Void, Error>) -> Void)

}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func register(parameters: [AnyHashable : Any], completionHanlder: @escaping (Result<UserModel, any Error>) -> Void) {
        let body: NSDictionary = parameters[K.ParametersKeys.body] as! NSDictionary
        let userModel = body[K.ParametersKeys.userModel] as! UserModel

        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHanlder(.failure(error))
            } else {
                completionHanlder(.success(userModel))
            }
        }
    }
    
    func login(parameters: [AnyHashable : Any], completionHanlder: @escaping (Result<UserModel, any Error>) -> Void) {
        let body: NSDictionary = parameters[K.ParametersKeys.body] as! NSDictionary
        let userModel = body[K.ParametersKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHanlder(.failure(error))
            } else {
                completionHanlder(.success(userModel))
            }
        }
    }
    
    
    func logout(completionHanlder: @escaping (Result<Void, any Error>) -> Void) {
        do {
            try self.auth.signOut()
            completionHanlder(.success(()))
        } catch let error as NSError {
            completionHanlder(.failure(error))
        }
    }
}
