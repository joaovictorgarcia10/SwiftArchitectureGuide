//
//  SettingsView.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 03/11/24.
//

import UIKit


protocol SettingsViewDelegate: AnyObject {
    func onTapLogout()
    func initUsername() -> String
    func initEmail() -> String
}

class SettingsView: UIView {
    weak var delegate: SettingsViewDelegate?
        
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc
    private func onTapLogout() {
        self.delegate?.onTapLogout()
    }
    
    @objc
    func initValues() {
        let username =  self.delegate?.initUsername()
        let email =  self.delegate?.initEmail()
        self.nameLabel.text = username
        self.emailLabel.text = email
    }
    
        
    // MARK: Properties
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Settings"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: K.Spacings.sp8, weight: .semibold)
        return label
    }()
    
    
    private lazy var circleAvatar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.backgroundColor = .systemGray
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: K.Spacings.sp5, weight: .semibold)
        return label
    }()
    
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "email@email.com"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: K.Spacings.sp4, weight: .semibold)
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = K.Spacings.sp1
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = K.Spacings.sp6
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = K.Spacings.sp2
        button.setTitle("Sair da conta", for: .normal)
        button.addTarget(self, action: #selector(onTapLogout), for: .touchUpInside)
        return button
    }()
}


// MARK: SetupView Protocol
extension SettingsView: SetupView {
    func setupView() {
        self.backgroundColor = .viewBackgroundColor
        self.setupHierarchy()
        self.setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(settingsLabel)
        self.verticalStackView.addArrangedSubview(nameLabel)
        self.verticalStackView.addArrangedSubview(emailLabel)
        self.horizontalStackView.addArrangedSubview(circleAvatar)
        self.horizontalStackView.addArrangedSubview(verticalStackView)
        self.addSubview(horizontalStackView)
        self.addSubview(logoutButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: K.Spacings.sp8),
            settingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: K.Spacings.sp6),
            settingsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -K.Spacings.sp6),
        ])
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: K.Spacings.sp8),
            horizontalStackView.leadingAnchor.constraint(equalTo: settingsLabel.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: settingsLabel.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            circleAvatar.widthAnchor.constraint(equalToConstant: 100),
            circleAvatar.heightAnchor.constraint(equalTo: circleAvatar.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: K.Spacings.sp8),
            logoutButton.leadingAnchor.constraint(equalTo: settingsLabel.leadingAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: settingsLabel.trailingAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: K.Spacings.sp12)
        ])
    }
}
