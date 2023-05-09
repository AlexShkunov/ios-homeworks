//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/23/23.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let userAvatar: UIImageView = {
        let image = UIImage(named: "profilePhoto")
        let userAvatar = UIImageView(image: image)
        userAvatar.layer.cornerRadius = 48
        userAvatar.clipsToBounds = true
        userAvatar.layer.borderColor = UIColor.white.cgColor
        userAvatar.layer.borderWidth = 3
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        return userAvatar
    }()
    
    private let animationViewForUserAvatar: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundForAnimation: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.frame = CGRect(x: .zero, y: .zero, width: Metric.screenWidth, height: Metric.screenHeight)
        view.isHidden = true
        view.alpha = 0
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.isHidden = true
        button.alpha = 0
        button.frame = CGRect(x: Metric.screenMinX + (Metric.screenWidth - Metric.buttonWidth), y: Metric.screenMinY, width: Metric.buttonWidth, height: Metric.buttonWidth)
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()
    
    private let userName: UILabel = {
        let userName = UILabel()
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.textColor = .black
        userName.text = "Jack Sparrow"
        userName.numberOfLines = 0
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    private var userPhrase: UILabel = {
        var userPhrase = UILabel()
        userPhrase.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userPhrase.textColor = .gray
        userPhrase.text = "Not all treasure is silver and gold, mate."
        userPhrase.numberOfLines = 0
        userPhrase.translatesAutoresizingMaskIntoConstraints = false
        return userPhrase
    }()
    
    private lazy var userButtom: UIButton = {
        let userButtom = UIButton()
        userButtom.setTitle("Show status", for: .normal)
        userButtom.setTitleColor(.white, for: .normal)
        userButtom.backgroundColor = .blue
        userButtom.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        userButtom.layer.cornerRadius = 4
        userButtom.clipsToBounds = true
        userButtom.layer.masksToBounds = false
        userButtom.layer.shadowOffset = CGSize(width: 4, height: 4)
        userButtom.layer.shadowRadius = 4
        userButtom.layer.shadowColor = UIColor.black.cgColor
        userButtom.layer.shadowOpacity = 0.7
        userButtom.translatesAutoresizingMaskIntoConstraints = false
        return userButtom
    }()
    
    private lazy var userText: TextFieldWithPadding = {
        let userText = TextFieldWithPadding()
        userText.backgroundColor = .white
        userText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        userText.textColor = .black
        userText.addTarget(self, action: #selector(changedStatus), for: .editingChanged)
        userText.layer.cornerRadius = 12
        userText.layer.borderColor = UIColor.black.cgColor
        userText.layer.borderWidth = 1
        userText.placeholder = "Type your status"
        userText.delegate = self
        userText.translatesAutoresizingMaskIntoConstraints = false
        return userText
    }()
    
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        layout()
        showStatus()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        animationViewForUserAvatar.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.625) {
                // userAvatar
                self.userAvatar.center = CGPoint(x: Metric.screenCenterX - Metric.viewInset, y: Metric.screenCenterY - self.animationViewForUserAvatar.bounds.height/2)
                self.userAvatar.transform = CGAffineTransform(scaleX: UIScreen.main.bounds.width/self.animationViewForUserAvatar.bounds.width, y: UIScreen.main.bounds.width/self.animationViewForUserAvatar.bounds.width)
                self.userAvatar.layer.cornerRadius = 0
                
                // backgroundForAnimation
                self.backgroundForAnimation.alpha = 0.5
                self.backgroundForAnimation.isHidden = false
                self.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.625, relativeDuration: 1.0) {
                // cancelButton
                self.cancelButton.alpha = 1
                self.cancelButton.isHidden = false
            }
        }
    }
    
    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut) {
            // cancelButton
            self.cancelButton.alpha = 0
            self.cancelButton.isHidden = true
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                // userAvatar
                self.userAvatar.center = CGPoint(x: self.animationViewForUserAvatar.bounds.midX, y: self.animationViewForUserAvatar.bounds.midY)
                self.userAvatar.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.userAvatar.layer.cornerRadius = 48
                
                // backgroundForAnimation
                self.backgroundForAnimation.alpha = 0
                self.backgroundForAnimation.isHidden = true
            }
        }
    }
    
    private func layout() {
        addSubview(userName)
        addSubview(userPhrase)
        addSubview(userButtom)
        addSubview(userText)
        addSubview(backgroundForAnimation)
        addSubview(animationViewForUserAvatar)
        animationViewForUserAvatar.addSubview(userAvatar)
        addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            // animationViewForUserAvatar
            animationViewForUserAvatar.topAnchor.constraint(equalTo: topAnchor, constant: Metric.viewInset),
            animationViewForUserAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.viewInset),
            animationViewForUserAvatar.widthAnchor.constraint(equalToConstant: 96),
            animationViewForUserAvatar.heightAnchor.constraint(equalToConstant: 96),
            
            // userAvatar
            userAvatar.topAnchor.constraint(equalTo: animationViewForUserAvatar.topAnchor),
            userAvatar.leadingAnchor.constraint(equalTo: animationViewForUserAvatar.leadingAnchor),
            userAvatar.bottomAnchor.constraint(equalTo: animationViewForUserAvatar.bottomAnchor),
            userAvatar.trailingAnchor.constraint(equalTo: animationViewForUserAvatar.trailingAnchor),
            
            // userName
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: animationViewForUserAvatar.trailingAnchor, constant: Metric.viewInset),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.viewInset),
            userName.heightAnchor.constraint(equalToConstant: 27),
            
            // user Phrase
            userPhrase.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: Metric.viewInset),
            userPhrase.leadingAnchor.constraint(equalTo: animationViewForUserAvatar.trailingAnchor, constant: Metric.viewInset),
            userPhrase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.viewInset),
            userPhrase.heightAnchor.constraint(equalToConstant: 27),
            
            // userButton
            userButtom.topAnchor.constraint(equalTo: animationViewForUserAvatar.bottomAnchor, constant: 44),
            userButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.viewInset),
            userButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.viewInset),
            userButtom.heightAnchor.constraint(equalToConstant: 50),
            userButtom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metric.viewInset),
            
            // userText
            userText.topAnchor.constraint(equalTo: userPhrase.bottomAnchor, constant: 10),
            userText.leadingAnchor.constraint(equalTo: userPhrase.leadingAnchor),
            userText.trailingAnchor.constraint(equalTo: userPhrase.trailingAnchor),
            userText.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func showStatus() {
        userPhrase.text = statusText
        print(userPhrase.text ?? "Status was not set")
    }
    
    @objc func changedStatus(_ textField: UITextField) {
        statusText = textField.text
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}

extension ProfileHeaderView {
    enum Metric {
        static let viewInset: CGFloat = 16
        static let screenRect = UIScreen.main.bounds
        static let screenWidth = screenRect.size.width
        static let screenHeight = screenRect.size.height
        static let screenCenterX = screenRect.midX
        static let screenCenterY = screenRect.midY
        static let screenMinX = screenRect.minX
        static let screenMinY = screenRect.minY
        static let buttonWidth = screenRect.size.width / 10
    }
}
