//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let feedViewController = FeedViewController()
        let feedNavigationViewController = UINavigationController(rootViewController: feedViewController)
        feedNavigationViewController.tabBarItem.title = "Feed"
        feedNavigationViewController.tabBarItem.image = UIImage(named: "feed")
        
        let logInViewControlle = LogInViewController()
        let logInNavigationViewControlle = UINavigationController(rootViewController: logInViewControlle)
        logInNavigationViewControlle.tabBarItem.title = "Profile"
        logInNavigationViewControlle.tabBarItem.image = UIImage(named: "profile")
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [feedNavigationViewController, logInNavigationViewControlle]
        tabViewController.tabBar.backgroundColor = UIColor.white
        tabViewController.tabBar.tintColor = UIColor.blue
        
        window.rootViewController = tabViewController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

