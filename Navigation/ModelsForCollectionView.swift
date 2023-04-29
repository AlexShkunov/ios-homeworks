//
//  ModelsForCollectionView.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/29/23.
//

import UIKit

struct ModelsForCollectionView {
    
    let photos: UIImage
    
    static func makeImageForCollection() -> [ModelsForCollectionView] {
        var image = [ModelsForCollectionView]()
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto1")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto2")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto3")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto4")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto5")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto6")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto7")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto8")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto9")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto10")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto11")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto12")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto13")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto14")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto15")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto16")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto17")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto18")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto19")!))
        
        image.append(ModelsForCollectionView(photos: UIImage(named: "Auto20")!))
        
        return image
    }
}
