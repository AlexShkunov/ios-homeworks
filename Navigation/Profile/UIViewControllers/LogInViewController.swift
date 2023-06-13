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
    private var configuration = UIButton.Configuration.filled()
    
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
    
    private let separation: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let insertLoginAndPassword: UIStackView = {
        let stackView = UIStackView()
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Email"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        textField.textContentType = .password
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(changePassword(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let countWarningLabelForWrongPassword: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordValidCapitalLetter: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordValidNumber: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        
        let username = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let correctUsername = "jack@icloud.com"
        let correctPassword = "blackPear1"
        
        if loginTextField.text?.isEmpty ?? true && passwordTextField.text?.isEmpty ?? true {
            shakeAnimationForLogin()
            loginTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
            shakeAnimationForPassword()
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
        } else if loginTextField.text?.isEmpty ?? true {
            shakeAnimationForLogin()
            loginTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
        } else if passwordTextField.text?.isEmpty ?? true {
            shakeAnimationForPassword()
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
        } else if !emailValid(email: username) {
            let alertController = UIAlertController(title: "Error", message: "Incorrect email address", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        } else if username != correctUsername || password != correctPassword {
            let alertController = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        } else {
            let profileViewControlle = ProfileViewControlle()
            navigationController?.pushViewController(profileViewControlle, animated: true)
        }
    }
    
    @objc private func changePassword(_ textField: UITextField) {
        if let password = textField.text {
            if password.count < 4 {
                countWarningLabelForWrongPassword.text = "Minimum 4 characters"
                countWarningLabelForWrongPassword.isHidden = false
            } else {
                countWarningLabelForWrongPassword.isHidden = true
            }
            if !passwordValidCapitalLetter(password: password) {
                passwordValidCapitalLetter.text = "The password must contain at least one capital letter"
                passwordValidCapitalLetter.isHidden = false
            } else {
                passwordValidCapitalLetter.isHidden = true
            }
            if !passwordValidNumber(password: password) {
                passwordValidNumber.text = "The password must contain at least one number"
                passwordValidNumber.isHidden = false
            } else {
                passwordValidNumber.isHidden = true
            }
        }
    }
    
    private func emailValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func passwordValidCapitalLetter(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z]).{0,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    private func passwordValidNumber(password: String) -> Bool {
        let passwordRegex = "(?=.*[0-9]).{0,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    private func shakeAnimationForLogin() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: loginTextField.center.x - 10, y: loginTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: loginTextField.center.x + 10, y: loginTextField.center.y))
        
        loginTextField.layer.add(animation, forKey: "position")
    }
    
    private func shakeAnimationForPassword() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x - 10, y: passwordTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x + 10, y: passwordTextField.center.y))
        
        passwordTextField.layer.add(animation, forKey: "position")
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoView)
        contentView.addSubview(insertLoginAndPassword)
        contentView.addSubview(logInButtom)
        contentView.addSubview(countWarningLabelForWrongPassword)
        contentView.addSubview(passwordValidCapitalLetter)
        contentView.addSubview(passwordValidNumber)
        
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
            
            // insertLoginAndPassword
            insertLoginAndPassword.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            insertLoginAndPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            insertLoginAndPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.viewInset),
            insertLoginAndPassword.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            separation.heightAnchor.constraint(equalToConstant: 0.5),
            
            // logInButtom
            logInButtom.topAnchor.constraint(equalTo: insertLoginAndPassword.bottomAnchor, constant: Metric.viewInset),
            logInButtom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            logInButtom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.viewInset),
            logInButtom.heightAnchor.constraint(equalToConstant: 50),
            
            // countWarningLabelForWrongPassword
            countWarningLabelForWrongPassword.topAnchor.constraint(equalTo: logInButtom.bottomAnchor, constant: Metric.viewInset),
            countWarningLabelForWrongPassword.leadingAnchor.constraint(equalTo: logInButtom.leadingAnchor),
            countWarningLabelForWrongPassword.trailingAnchor.constraint(equalTo: logInButtom.trailingAnchor),
            
            // passwordValidCapitalLetter
            passwordValidCapitalLetter.topAnchor.constraint(equalTo: countWarningLabelForWrongPassword.bottomAnchor, constant: Metric.viewInset),
            passwordValidCapitalLetter.leadingAnchor.constraint(equalTo: countWarningLabelForWrongPassword.leadingAnchor),
            passwordValidCapitalLetter.trailingAnchor.constraint(equalTo: countWarningLabelForWrongPassword.trailingAnchor),
            
            // passwordValidNumber
            passwordValidNumber.topAnchor.constraint(equalTo: passwordValidCapitalLetter.bottomAnchor, constant: Metric.viewInset),
            passwordValidNumber.leadingAnchor.constraint(equalTo: passwordValidCapitalLetter.leadingAnchor),
            passwordValidNumber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            passwordValidNumber.trailingAnchor.constraint(equalTo: passwordValidCapitalLetter.trailingAnchor)
        ])
        
        insertLoginAndPassword.addArrangedSubview(loginTextField)
        insertLoginAndPassword.addArrangedSubview(separation)
        insertLoginAndPassword.addArrangedSubview(passwordTextField)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension LogInViewController {
    enum Metric {
        static let viewInset: CGFloat = 16
    }
}
