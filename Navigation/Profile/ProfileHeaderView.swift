//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
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
    
    private lazy var userText: UITextField = {
        let userText = UITextField()
        userText.backgroundColor = .white
        userText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        userText.textColor = .black
        userText.addTarget(self, action: #selector(changedStatus), for: .editingChanged)
        userText.layer.cornerRadius = 12
        userText.layer.borderColor = UIColor.black.cgColor
        userText.layer.borderWidth = 1
        userText.translatesAutoresizingMaskIntoConstraints = false
        return userText
    }()
    
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        showStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(userAvatar)
        addSubview(userName)
        addSubview(userPhrase)
        addSubview(userButtom)
        addSubview(userText)
        
        NSLayoutConstraint.activate([
            // userAvatar
            userAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userAvatar.widthAnchor.constraint(equalToConstant: 96),
            userAvatar.heightAnchor.constraint(equalToConstant: 96),
            
            // userName
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 16),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userName.heightAnchor.constraint(equalToConstant: 27),
            
            // user Phrase
            userPhrase.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 16),
            userPhrase.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 16),
            userPhrase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userPhrase.heightAnchor.constraint(equalToConstant: 27),
            
            // userButton
            userButtom.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 44),
            userButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userButtom.heightAnchor.constraint(equalToConstant: 50),
            userButtom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
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
