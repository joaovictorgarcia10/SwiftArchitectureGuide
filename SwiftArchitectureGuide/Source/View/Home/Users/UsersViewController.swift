//
//  UsersViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 02/11/24.
//

import UIKit

class UsersViewController: UIViewController {
    // MARK: View
    lazy var usersView: UsersView = {
        let view = UsersView(frame: .zero)
        return view;
        
    }()

    
    // MARK: Overrides
    override func loadView() {
        super.loadView()
        self.view = usersView
        print("UsersView initialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
