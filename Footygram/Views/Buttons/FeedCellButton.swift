//
//  FeedCellButton.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/30/21.
//

import UIKit

class FeedCellButton: UIView {
  
  static let inactiveColor = UIColor.systemGray5.withAlphaComponent(0.5)
  
  // TODO: This needs to be set in the cellForRowAt equivalent to avoid broken states when reusing the cell
  var isFavorite = false {
    didSet {
      handleFavorite()
    }
  }
  
  // MARK: -
  
  let buttonContainer: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 8
    view.layer.masksToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = FeedCellButton.inactiveColor.cgColor
    return view
  }()
  
  let favoriteIcon: UIImageView = {
    let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
    let image = UIImage(systemName: "star.fill", withConfiguration: config)
    let view = UIImageView(image: image)
    view.tintColor = inactiveColor
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    
    layoutButton()
    layoutIcon()
    
    configureGestures()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Gestures
  
  fileprivate func configureGestures() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFavoriteTap(sender:)))
    buttonContainer.addGestureRecognizer(tapGesture)
  }
  
  @objc func handleFavoriteTap(sender: UITapGestureRecognizer) {
    isFavorite.toggle()
  }
  
  // MARK: - Helpers
  
  func handleFavorite() {
    if isFavorite {
      buttonContainer.backgroundColor = UIColor.systemGray5.withAlphaComponent(0.7)
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
        self?.favoriteIcon.transform = CGAffineTransform(scaleX: 5, y: 5)
        self?.favoriteIcon.transform = .identity
      }
      
      favoriteIcon.tintColor = .systemYellow
    } else if !isFavorite {
      buttonContainer.backgroundColor = .clear

      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
        self?.favoriteIcon.transform = CGAffineTransform(scaleX: 5, y: 5)
        self?.favoriteIcon.transform = .identity
      }
      
      favoriteIcon.tintColor = FeedCellButton.inactiveColor
    }
  }
  
}

// MARK: - Layout

fileprivate extension FeedCellButton {

  func layoutButton() {
    addSubview(buttonContainer)
    buttonContainer.fillOther(view: self)
  }
  
  func layoutIcon() {
    let xPadding: CGFloat = 8
    let yPadding: CGFloat = 10
    
    buttonContainer.addSubview(favoriteIcon)
    
    NSLayoutConstraint.activate([
      favoriteIcon.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor, constant: xPadding),
      favoriteIcon.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: -xPadding),
      favoriteIcon.topAnchor.constraint(equalTo: buttonContainer.topAnchor, constant: yPadding),
      favoriteIcon.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: -yPadding),
    ])
  }
  
}
