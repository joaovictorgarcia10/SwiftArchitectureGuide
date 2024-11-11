//
//  FavoritesViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 02/11/24.
//

import UIKit

class FavoritesViewController: UIViewController {
    // MARK: View
    lazy var favoritesView: FavoritesView = {
        let view = FavoritesView(frame: .zero)
        return view;
    }()

    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = favoritesView
    }
}
