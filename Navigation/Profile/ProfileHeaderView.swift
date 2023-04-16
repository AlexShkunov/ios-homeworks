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
        return userAvatar
    }()
    
    private let userName: UILabel = {
        let userName = UILabel()
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.textColor = .black
        userName.text = "Jack Sparrow"
        userName.numberOfLines = 0
        return userName
    }()
    
    private var userPhrase: UILabel = {
        var userPhrase = UILabel()
        userPhrase.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userPhrase.textColor = .gray
        userPhrase.text = "Not all treasure is silver and gold, mate."
        userPhrase.numberOfLines = 0
        return userPhrase
    }()
    
    private lazy var userButtom: UIButton = {
        let userButtom = UIButton()
        userButtom.setTitle("Show status", for: .normal)
        userButtom.setTitleColor(.white, for: .normal)
        userButtom.backgroundColor = .blue
        userButtom.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        return userButtom
    }()
    
    private lazy var userText: UITextField = {
        let userText = UITextField()
        userText.backgroundColor = .white
        userText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        userText.textColor = .black
        userText.addTarget(self, action: #selector(changedStatus), for: .editingChanged)
        return userText
    }()
    
    private var statusText: String?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(userAvatar)
        addSubview(userName)
        addSubview(userPhrase)
        addSubview(userButtom)
        addSubview(userText)
        showStatus()
        
        // userAvatar
        userAvatar.frame = CGRect(x: 16, y: 32, width: 150, height: 150)
        userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        userAvatar.clipsToBounds = true
        userAvatar.layer.borderColor = UIColor.white.cgColor
        userAvatar.layer.borderWidth = 3
        
        // userName
        userName.frame = CGRect(x: 182, y: 27, width: 200, height: 50)
        
        // user Phrase
        userPhrase.frame = CGRect(x: 182, y: 78, width: 200, height: 70)
        
        // userButton
        userButtom.frame = CGRect(x: 16, y: 204, width: self.frame.size.width - 32, height: 50)
        userButtom.layer.cornerRadius = 4
        userButtom.clipsToBounds = true
        userButtom.layer.masksToBounds = false
        userButtom.layer.shadowOffset = CGSize(width: 4, height: 4)
        userButtom.layer.shadowRadius = 4
        userButtom.layer.shadowColor = UIColor.black.cgColor
        userButtom.layer.shadowOpacity = 0.7
        
        // userText
        userText.frame = CGRect(x: 182, y: 148, width: 197, height: 40)
        userText.layer.cornerRadius = 12
        userText.layer.borderColor = UIColor.black.cgColor
        userText.layer.borderWidth = 1
    }
    
    @objc func showStatus() {
        userPhrase.text = statusText
        print(userPhrase.text ?? "Status was not set")
    }
    
    @objc func changedStatus(_ textField: UITextField) {
        statusText = textField.text
    }
}
