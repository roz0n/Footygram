//
//  FeedCollectionHeaderView.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/30/21.
//

import UIKit

class FeedCollectionHeaderView: UIView {
  
  static let reuseId = "FeedHeaderView"
  static let estimatedHeight: CGFloat = 125
  
  let contentView: UIVisualEffectView = {
    let effect = UIBlurEffect(style: .systemThinMaterial)
    let view = UIVisualEffectView(effect: effect)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
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
