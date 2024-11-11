//
//  UsersViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 02/11/24.
//

import UIKit

class UsersViewController: UIViewController {
    
    // MARK: Properties
    private lazy var usersView: UsersView = {
        let view = UsersView(frame: .zero)
        return view;
        
    }()
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = usersView
    }
}
