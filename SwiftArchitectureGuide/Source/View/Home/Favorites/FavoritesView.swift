//
//  UsersView.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 02/11/24.
//

import UIKit

class FavoritesView: UIView {
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties

    
    // MARK: Actions
}


extension FavoritesView: SetupView {
    func setupView() {
        self.backgroundColor = .viewBackgroundColor
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {}
    
    func setupConstraints() {}
}
