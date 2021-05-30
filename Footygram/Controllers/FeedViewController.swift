//
//  FeedViewController.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/29/21.
//

import UIKit

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let dataManager = DataManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
  }
  
  // MARK: - Configurations
  
  fileprivate func configureCollectionView() {
    let layout = self.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.sectionHeadersPinToVisibleBounds = true
    
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseId)
    collectionView.register(FeedCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FeedCollectionHeaderView.reuseId)
  }
  
  // MARK: - UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataManager.totalImageCount
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.reuseId, for: indexPath) as? FeedCollectionViewCell
    let imageId = (indexPath.row + 1)
    
    if let cell = cell {
      if imageId <= dataManager.totalImageCount {
        DispatchQueue.global(qos: .utility).async { [weak self] in
          let data = self?.dataManager.fetchImage(id: imageId)
          
          DispatchQueue.main.async {
            cell.cellImage = data
          }
        }
      }
      
      print("Dequeuing cell: \(indexPath.row)")
      return cell
    } else {
      fatalError("Unable to dequeue Feed cell")
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FeedCollectionHeaderView.reuseId, for: indexPath) as? FeedCollectionHeaderView
    return header!
  }
  
  // MARK: - UICollectionViewDelegateFlowLayout
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.collectionView.bounds.size.width, height: FeedCollectionHeaderView.estimatedHeight)
  }
  
}
