//
//  FeedCollectionViewCell.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/29/21.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
  
  static let reuseId = "FeedCollectionCell"
  
  let favoriteButton = FeedCellButton()
  
  // MARK: -
  
  var cellImage: Data? = nil {
    didSet {
      if let cellImage = cellImage {
        imageContainer.image = UIImage(data: cellImage)
      }
    }
  }
  
  let imageContainer: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .center
    return view
  }()
  
  var hasImages: Bool {
    get {
      return imageContainer.image != nil || cellImage != nil
    }
  }
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    applyLayouts()
    configureContentView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View Lifecycle
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    // TODO: Is this even needed?
    if hasImages {
      resetImage()
    }
  }
  
  // MARK: - Configurations
  
  fileprivate func configureContentView() {
    contentView.backgroundColor = .systemGray5
    contentView.layer.cornerRadius = 16
    contentView.layer.masksToBounds = true
    contentView.layer.borderColor = UIColor.systemGray2.withAlphaComponent(0.2).cgColor
  }
  
  // MARK: - Helpers
  
  fileprivate func resetImage() {
    cellImage = nil
    imageContainer.image = nil
  }
  
}

// MARK: - Layout

fileprivate extension FeedCollectionViewCell {
  
  func applyLayouts() {
    layoutContentView()
    layoutImageContainer()
    layoutFavoritesButton()
  }
  
  func layoutContentView() {
    let padding: CGFloat = 14
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      contentView.topAnchor.constraint(equalTo: topAnchor, constant: padding / 3),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding / 3)
    ])
  }
  
  func layoutImageContainer() {
    contentView.addSubview(imageContainer)
    
    NSLayoutConstraint.activate([
      imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func layoutFavoritesButton() {
    contentView.addSubview(favoriteButton)
    
    NSLayoutConstraint.activate([
      favoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
      favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
      favoriteButton.heightAnchor.constraint(equalToConstant: 50),
      favoriteButton.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
  
}
