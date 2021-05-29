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
    backgroundColor = .systemGray5
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
