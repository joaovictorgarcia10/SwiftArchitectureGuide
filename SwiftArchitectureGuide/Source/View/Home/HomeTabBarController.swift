//
//  HomeViewController.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 20/10/24.
//

import UIKit

protocol HomeTabBarControllerDelegate: AnyObject {
    func navigateToLogin() -> Void
}

class HomeTabBarController: UITabBarController {
    var homeTabBarControllerDelegate: HomeTabBarControllerDelegate?
    
    // MARK: ViewControllers
    private let usersViewController = UsersViewController()
    private let favoritesViewController = FavoritesViewController()
    private let settingsViewController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUsersViewController()
        setupFavoritesViewController()
        setupSettingsViewController()
        
        self.navigationItem.hidesBackButton = true
        self.tabBar.frame = .zero
        self.tabBar.backgroundColor = .black
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = true
        self.viewControllers = [usersViewController, favoritesViewController, settingsViewController]
    }
    
    // MARK: Setup ViewControllers
    private func setupUsersViewController() {
        self.usersViewController.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.circle"), tag: 0)
    }
    
    private func setupFavoritesViewController() {
        self.favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
    }
    
    private func setupSettingsViewController() {
        self.settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        self.settingsViewController.navigateToLogin = {self.homeTabBarControllerDelegate?.navigateToLogin()}
    }
}

