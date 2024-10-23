//
//  LoginViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        return view;
    }()
    
    
    // MARK: Overrides
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
}
