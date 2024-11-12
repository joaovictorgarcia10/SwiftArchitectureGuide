//
//  UserProvider.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 18/09/24.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol: AnyObject {
    func register(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func login(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func logout(completionHandler: @escaping(Result<Void, Error>) -> Void)
    func getUserData(completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, any Error>) -> Void) {
        let body: NSDictionary = parameters[K.ParametersKeys.body] as! NSDictionary
        let userModel = body[K.ParametersKeys.userModel] as! UserModel

        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, any Error>) -> Void) {
        let body: NSDictionary = parameters[K.ParametersKeys.body] as! NSDictionary
        let userModel = body[K.ParametersKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
    
    func logout(completionHandler: @escaping (Result<Void, any Error>) -> Void) {
        do {
            try self.auth.signOut()
            completionHandler(.success(()))
        } catch let error as NSError {
            completionHandler(.failure(error))
        }
    }
    
    
    func getUserData(completionHandler: @escaping (Result<UserModel, any Error>) -> Void) {
        guard let user = self.auth.currentUser else {
            completionHandler(.failure(NSError(domain: "getUserData", code: -1, userInfo: ["message": "No user found"])))
            return
        }

        let email = user.email ?? ""
        let userModel = UserModel(email: email, password: "")
        completionHandler(.success(userModel))
    }
}
