//
//  PostForUITableView.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/23/23.
//

import UIKit

struct PostForProfile {
    let author: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int
    
    static func makePostForProfile() -> [PostForProfile] {
        var post = [PostForProfile]()
        
        post.append(PostForProfile(author: "LandRover.uk", description: "The reductive nature of the design is free from superfluous detail, resulting in a form which has breathtaking modernity. This is the most desirable Range Rover ever created.", image: UIImage(named: "LandRover")!, likes: 879, views: 992))
        post.append(PostForProfile(author: "Porsche.de", description: "Porsche Taycan drifts into the Guinness World Records book.", image: UIImage(named: "Porsche")!, likes: 743, views: 917))
        post.append(PostForProfile(author: "Mercedes.de", description: "The Mercedes-AMG SL, a new edition of an automotive icon, returns to its roots with a classic soft top and powerful, dynamic character.", image: UIImage(named: "Mercedes")!, likes: 697, views: 869))
        post.append(PostForProfile(author: "Dodge.us", description: "Leading from the front of the pack, the Dodge Challenger SRT® Super Stock flaunt the highest horsepower of any production car.", image: UIImage(named: "Dodge")!, likes: 758, views: 827))
        
        return post
    }
}
