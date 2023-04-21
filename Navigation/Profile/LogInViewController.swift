//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/20/23.
//

import UIKit

class LogInViewController: UIViewController {
    
    let colorSet = #colorLiteral(red: 0.2842359245, green: 0.5194783211, blue: 0.7980182171, alpha: 1)
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let logoView: UIImageView = {
        let image = UIImage(named: "Logo")
        let logoView = UIImageView(image: image)
        logoView.contentMode = .scaleAspectFit
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    private let loginAndPassword: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        textField.textContentType = .password
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var configuration = UIButton.Configuration.filled()
    
    lazy var handler: UIButton.ConfigurationUpdateHandler = { [self] button in
        switch button.state {
        case [.selected, .highlighted]:
            button.configuration?.background.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!).withAlphaComponent(0.8)
        case .selected:
            button.configuration?.background.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!).withAlphaComponent(0.8)
        case .highlighted:
            button.configuration?.background.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!).withAlphaComponent(0.8)
        case .disabled:
            button.configuration?.background.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!).withAlphaComponent(0.8)
        default:
            button.configuration?.background.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!).withAlphaComponent(1)
        }
    }
    
    private lazy var logInButtom: UIButton = {
        let logInButttom = UIButton(configuration: configuration, primaryAction: nil)
        logInButttom.configurationUpdateHandler = handler
        logInButttom.setTitle("Log in", for: .normal)
        logInButttom.setTitleColor(.white, for: .normal)
        logInButttom.layer.cornerRadius = 10
        logInButttom.layer.masksToBounds = true
        logInButttom.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
        logInButttom.translatesAutoresizingMaskIntoConstraints = false
        return logInButttom
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func showProfile() {
        let profileViewControlle = ProfileViewControlle()
        navigationController?.pushViewController(profileViewControlle, animated: true)
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoView)
        contentView.addSubview(loginAndPassword)
        loginAndPassword.addSubview(loginTextField)
        loginAndPassword.addSubview(passwordTextField)
        contentView.addSubview(logInButtom)
        
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // logoView
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            
            // loginAndPassword
            loginAndPassword.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            loginAndPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginAndPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginAndPassword.heightAnchor.constraint(equalToConstant: 100),
            
            // loginTextField
            loginTextField.topAnchor.constraint(equalTo: loginAndPassword.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: loginAndPassword.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: loginAndPassword.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: loginAndPassword.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginAndPassword.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // logInButtom
            logInButtom.topAnchor.constraint(equalTo: loginAndPassword.bottomAnchor, constant: 16),
            logInButtom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButtom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            logInButtom.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
