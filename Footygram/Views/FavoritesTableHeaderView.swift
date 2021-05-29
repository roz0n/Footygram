//
//  FavoritesTableHeaderView.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/29/21.
//

import UIKit

class FavoritesTableHeaderView: UIView {
  
  let headerText: UITextView = {
    let view = UITextView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isScrollEnabled = false
    view.isUserInteractionEnabled = false
    view.textContainer.maximumNumberOfLines = 0
    view.textContainer.lineBreakMode = .byCharWrapping
    view.text = "Your favorite all-time images are stored here for peak nostalgia. Tap an image to interact with it or save it to your camera roll."
    view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    view.textColor = .systemGray
    view.textContainerInset = UIEdgeInsets(top: 20, left: 12, bottom: 20, right: 16)
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemGray6
    layoutHeaderText()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: - Layout

extension FavoritesTableHeaderView {
  
  func layoutHeaderText() {
    addSubview(headerText)
    NSLayoutConstraint.activate([
      headerText.heightAnchor.constraint(equalTo: self.heightAnchor),
      headerText.widthAnchor.constraint(equalTo: self.widthAnchor)
    ])
  }
  
}
