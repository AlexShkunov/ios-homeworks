//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/29/23.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let titleOfPhotos: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.contentMode = .scaleAspectFit
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    private let firstImage: UIImageView = {
        let firstImage = UIImageView()
        firstImage.layer.cornerRadius = 6
        firstImage.clipsToBounds = true
        firstImage.contentMode = .scaleAspectFill
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        return firstImage
    }()
    
    private let secondImage: UIImageView = {
        let secondImage = UIImageView()
        secondImage.layer.cornerRadius = 6
        secondImage.clipsToBounds = true
        secondImage.contentMode = .scaleAspectFill
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        return secondImage
    }()
    
    private let thirdImage: UIImageView = {
        let thirdImage = UIImageView()
        thirdImage.layer.cornerRadius = 6
        thirdImage.clipsToBounds = true
        thirdImage.contentMode = .scaleAspectFill
        thirdImage.translatesAutoresizingMaskIntoConstraints = false
        return thirdImage
    }()
    
    private let fourthImage: UIImageView = {
        let fourthImage = UIImageView()
        fourthImage.layer.cornerRadius = 6
        fourthImage.clipsToBounds = true
        fourthImage.contentMode = .scaleAspectFill
        fourthImage.translatesAutoresizingMaskIntoConstraints = false
        return fourthImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleOfPhotos.text = nil
        arrow.image = nil
        firstImage.image = nil
        secondImage.image = nil
        thirdImage.image = nil
        fourthImage.image = nil
    }
    
    func setupCell(image: SettingsForPhotosTableView) {
        titleOfPhotos.text = image.title
        arrow.image = image.arrow
        firstImage.image = image.firstImage
        secondImage.image = image.secondImage
        thirdImage.image = image.thirdImage
        fourthImage.image = image.fourthImage
    }
    
    private func layout() {
        [titleOfPhotos,arrow, firstImage, secondImage, thirdImage, fourthImage].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // titleOfPhotos
            titleOfPhotos.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.viewInset),
            titleOfPhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            
            // arrow
            arrow.centerYAnchor.constraint(equalTo: titleOfPhotos.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.viewInset),
            
            // firstImage
            firstImage.topAnchor.constraint(equalTo: titleOfPhotos.bottomAnchor, constant: Metric.viewInset),
            firstImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            firstImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.viewInset),
            firstImage.widthAnchor.constraint(equalToConstant: Metric.screenWidth),
            firstImage.heightAnchor.constraint(equalToConstant: Metric.screenWidth),
            
            // secondImage
            secondImage.topAnchor.constraint(equalTo: firstImage.topAnchor),
            secondImage.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: Metric.imageInset),
            secondImage.widthAnchor.constraint(equalToConstant: Metric.screenWidth),
            secondImage.bottomAnchor.constraint(equalTo: firstImage.bottomAnchor),
            
            // thirdImage
            thirdImage.topAnchor.constraint(equalTo: secondImage.topAnchor),
            thirdImage.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: Metric.imageInset),
            thirdImage.widthAnchor.constraint(equalToConstant: Metric.screenWidth),
            thirdImage.bottomAnchor.constraint(equalTo: secondImage.bottomAnchor),
            
            // fourthImage
            fourthImage.topAnchor.constraint(equalTo: thirdImage.topAnchor),
            fourthImage.leadingAnchor.constraint(equalTo: thirdImage.trailingAnchor, constant: Metric.imageInset),
            fourthImage.widthAnchor.constraint(equalToConstant: Metric.screenWidth),
            fourthImage.bottomAnchor.constraint(equalTo: thirdImage.bottomAnchor)
        ])
    }
}

extension PhotosTableViewCell {
    enum Metric {
        static let viewInset: CGFloat = 12
        static let imageInset: CGFloat = 8
        static let screenRect = UIScreen.main.bounds
        static let screenWidth = (screenRect.size.width - 48) / 4
    }
}
