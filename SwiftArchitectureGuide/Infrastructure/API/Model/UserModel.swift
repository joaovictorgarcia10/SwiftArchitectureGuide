//
//  UserModel.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 18/09/24.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
