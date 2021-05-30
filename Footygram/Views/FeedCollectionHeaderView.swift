//
//  FeedCollectionHeaderView.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/30/21.
//

import UIKit

class FeedCollectionHeaderView: UICollectionReusableView {
  
  static let reuseId = "FeedHeaderView"
  static let estimatedHeight: CGFloat = 100
  
  let contentView: UIView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGreen
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layoutContentView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: - Layout

fileprivate extension FeedCollectionHeaderView {
  
  func layoutContentView() {
    addSubview(contentView)
    
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.widthAnchor.constraint(equalTo: widthAnchor),
      contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
    ])
  }
  
}
