//
//  UserViewModel.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 24/10/24.
//

import Foundation

class UserViewModel {
    private let model: UserModel
    
    // MARK: Initializers
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    // MARK: Properties
    var email: String {
        model.email
    }
        
    // MARK: Methods
    func login(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } errorHandler: { error in
            completion(.failure(error))
        }
    }
    
    func register(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } errorHandler: { error in
            completion(.failure(error))
        }
    }
    
    
    func logout(completion: @escaping(Result<Void, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.logout() {
            completion(.success(()))
        } errorHandler: { error in
            completion(.failure(error))
        }
    }
}
