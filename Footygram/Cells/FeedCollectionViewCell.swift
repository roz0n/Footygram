//
//  FeedCollectionViewCell.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/29/21.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
  
  static let reuseId = "FeedCollectionCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureContentView()
    layoutContentView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configurations
  
  fileprivate func configureContentView() {
    contentView.backgroundColor = .systemGray5
    contentView.layer.cornerRadius = 16
    contentView.layer.masksToBounds = true
  }
  
}

// MARK: - Layout

extension FeedCollectionViewCell {
  
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
  
}
