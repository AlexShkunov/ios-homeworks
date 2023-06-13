//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/29/23.
//

import UIKit

protocol Delegate: AnyObject {
    func tapImage(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: Delegate?
    private var indexPathCell = IndexPath()
    
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
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photo.image = nil
    }
    
    @objc private func tapAction() {
        delegate?.tapImage(photo.image, frameImage: photo.frame, indexPath: indexPathCell)
    }
    
    func setupCell(image: ModelsForCollectionView) {
        photo.image = image.photos
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photo.isUserInteractionEnabled = true
        photo.addGestureRecognizer(tapGesture)
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



