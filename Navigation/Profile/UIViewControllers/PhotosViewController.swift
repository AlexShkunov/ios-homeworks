//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/29/23.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let modelsForCollectionView = ModelsForCollectionView.makeImageForCollection()
    private var startImageRect: CGRect = .zero
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let whiteViewForAnimate: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.7
        view.frame = CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return view
    }()
    
    private lazy var cancelButtonForAnimate: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        button.frame = CGRect(x: Metric.screenMinX + (Metric.screenWidth - Metric.buttonWidth), y: 100, width: Metric.buttonWidth, height: Metric.buttonWidth)
        return button
    }()
    
    private let imageViewForAnimate: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        title = "Photo Gallery"
        layout()
    }
    
    @objc private func cancelButtonAction() {
        cancelButtonForAnimate.removeFromSuperview()
        whiteViewForAnimate.removeFromSuperview()
        animateImageToStart(rect: startImageRect)
    }
    
    private func animateImageToStart(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.imageViewForAnimate.frame = rect
        } completion: { _ in
            self.imageViewForAnimate.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteViewForAnimate)
        view.addSubview(cancelButtonForAnimate)
        view.addSubview(imageViewForAnimate)
        imageViewForAnimate.image = image
        imageViewForAnimate.alpha = 1.0
        imageViewForAnimate.frame = CGRect(x: imageFrame.origin.x,
                                           y: imageFrame.origin.y,
                                           width: imageFrame.width,
                                           height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.imageViewForAnimate.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                         height: UIScreen.main.bounds.width)
            self.imageViewForAnimate.center = self.view.center
        }
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelsForCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(image: modelsForCollectionView[indexPath.item])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

extension PhotosViewController: Delegate {
    func tapImage(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let theAttributes = collectionView.layoutAttributesForItem(at: indexPath)
        let cellFrameInSuperview = collectionView.convert(theAttributes!.frame, to: collectionView.superview)
        startImageRect = CGRect(x: frameImage.origin.x + cellFrameInSuperview.origin.x,
                                y: frameImage.origin.y + cellFrameInSuperview.origin.y,
                                width: frameImage.width,
                                height: frameImage.height)
        
        animateImage(image, imageFrame: startImageRect)
    }
}

extension PhotosViewController {
    enum Metric {
        static let screenRect = UIScreen.main.bounds
        static let screenWidth = screenRect.size.width
        static let screenMinX = screenRect.minX
        static let buttonWidth = screenRect.size.width / 10
    }
}
