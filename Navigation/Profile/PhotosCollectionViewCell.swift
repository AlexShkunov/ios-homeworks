//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/29/23.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let photo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(image: ModelsForCollectionView) {
        photo.image = image.photos
    }
    
    private func layout() {
        contentView.addSubview(photo)
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}



