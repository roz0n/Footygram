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
    view.text = "The greatest images of all time are stored here for peak nostalgic purposes. Tap on an image to interact with it further or save it to your camera roll."
    view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    view.textContainerInset = UIEdgeInsets(top: 20, left: 12, bottom: 20, right: 12)
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
