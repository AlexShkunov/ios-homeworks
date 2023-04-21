//
//  ProfileViewControlle.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class ProfileViewControlle: UIViewController {
    
    var profileHeaderView: ProfileHeaderView?
    
    private lazy var setNewTitleButtom: UIButton = {
        var setNewTitleButtom = UIButton()
        setNewTitleButtom.setTitle("Change title", for: .normal)
        setNewTitleButtom.setTitleColor(.white, for: .normal)
        setNewTitleButtom.backgroundColor = .blue
        setNewTitleButtom.translatesAutoresizingMaskIntoConstraints = false
        return setNewTitleButtom
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "Profile"
        
        profileHeaderView = ProfileHeaderView()
        profileHeaderView?.backgroundColor = .clear
        profileHeaderView?.translatesAutoresizingMaskIntoConstraints = false
        if let profileHeaderView = profileHeaderView {
            view.addSubview(profileHeaderView)
        }
        layoutForButtom()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            profileHeaderView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView!.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func layoutForButtom() {
        view.addSubview(setNewTitleButtom)
        
        NSLayoutConstraint.activate([
            // setNewTitleButtom
            setNewTitleButtom.heightAnchor.constraint(equalToConstant: 50),
            setNewTitleButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            setNewTitleButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            setNewTitleButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
