//
//  SettingsForPhotosTableView.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/29/23.
//

import UIKit

struct SettingsForPhotosTableView {
    let title: String
    let arrow: UIImage
    let firstImage: UIImage
    let secondImage: UIImage
    let thirdImage: UIImage
    let fourthImage: UIImage
    
    static func makeImageForPhotos() -> [SettingsForPhotosTableView] {
        var image = [SettingsForPhotosTableView]()
        
        image.append(SettingsForPhotosTableView(title: "Photos", arrow: UIImage(named: "Arrow")! , firstImage: UIImage(named: "Auto1")!, secondImage: UIImage(named: "Auto2")!, thirdImage: UIImage(named: "Auto3")!, fourthImage: UIImage(named: "Auto4")!))
        
        return image
    }
}
