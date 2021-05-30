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
  
  let headerIcon = UIImage(named: "ballon-dor")
  
  let effectView: UIVisualEffectView = {
    let effect = UIBlurEffect(style: .systemThinMaterial)
    let view = UIVisualEffectView(effect: effect)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let headerImageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    layoutContentView()
    layoutHeaderImage()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: - Layout

fileprivate extension FeedCollectionHeaderView {
  
  func layoutContentView() {
    addSubview(effectView)
    
    NSLayoutConstraint.activate([
      effectView.topAnchor.constraint(equalTo: topAnchor),
      effectView.widthAnchor.constraint(equalTo: widthAnchor),
      effectView.centerXAnchor.constraint(equalTo: centerXAnchor),
      effectView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
    ])
  }
  
  func layoutHeaderImage() {
    guard let headerIcon = headerIcon else { return }
    
    headerImageView.image = headerIcon
    effectView.contentView.addSubview(headerImageView)
    
    NSLayoutConstraint.activate([
      headerImageView.centerYAnchor.constraint(equalTo: effectView.contentView.safeAreaLayoutGuide.centerYAnchor),
      headerImageView.centerXAnchor.constraint(equalTo: effectView.contentView.safeAreaLayoutGuide.centerXAnchor),
      headerImageView.widthAnchor.constraint(equalToConstant: 40),
      headerImageView.heightAnchor.constraint(equalToConstant: 45),
    ])
  }
  
}
