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
  
  let headerContainer: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .clear
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
    addSubview(headerContainer)
    
    NSLayoutConstraint.activate([
      headerContainer.topAnchor.constraint(equalTo: topAnchor),
      headerContainer.widthAnchor.constraint(equalTo: widthAnchor),
      headerContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
      headerContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
    ])
  }
  
  func layoutHeaderImage() {
    guard let headerIcon = headerIcon else { return }
    
    headerImageView.image = headerIcon
    headerContainer.addSubview(headerImageView)
    
    NSLayoutConstraint.activate([
      headerImageView.centerYAnchor.constraint(equalTo: headerContainer.safeAreaLayoutGuide.centerYAnchor),
      headerImageView.centerXAnchor.constraint(equalTo: headerContainer.safeAreaLayoutGuide.centerXAnchor),
      headerImageView.widthAnchor.constraint(equalToConstant: 40),
      headerImageView.heightAnchor.constraint(equalToConstant: 45),
    ])
  }
  
}
