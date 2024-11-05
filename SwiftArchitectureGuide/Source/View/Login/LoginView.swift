//
//  LoginView.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 21/10/24.
//

import UIKit

protocol LoginViewDelegate {
    func onTapLogin(_ email: String, _ password: String) -> Void
    func onTapRegister() -> Void
}

class LoginView: UIView {
    var delegate: LoginViewDelegate?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = K.Spacings.sp1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = "Digite o seu email"
        textField.keyboardType = .emailAddress
        textField.setLeftPaddingPoints(K.Spacings.sp3)
        return textField
    }()
    
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = K.Spacings.sp1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = "Digite a sua senha"
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(K.Spacings.sp3)
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = K.Spacings.sp2
        button.setTitle("Entrar", for: .normal)
        button.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = K.Spacings.sp2
        button.setTitle("Criar conta", for: .normal)
        button.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
        return button
    }()
    
    // MARK: Actions
    @objc
    private func onTapLogin() {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            delegate?.onTapLogin(email, password)
        }
    }
    
    @objc
    private func onTapRegister() {
        delegate?.onTapRegister()
    }
}


// MARK: SetupView Protocol
extension LoginView: SetupView {
    func setupView() {
        self.backgroundColor = .viewBackgroundColor
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: K.Spacings.sp16),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: K.Spacings.sp6),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -K.Spacings.sp6),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: K.Spacings.sp2),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: K.Spacings.sp12)
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: K.Spacings.sp8),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: K.Spacings.sp2),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: K.Spacings.sp12)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: K.Spacings.sp16),
            loginButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: K.Spacings.sp12)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: K.Spacings.sp8),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: K.Spacings.sp12)
        ])
    }
}
