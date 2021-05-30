//
//  FeedViewController.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/29/21.
//

import UIKit

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let headerView = FeedCollectionHeaderView()
  let refreshControl = UIRefreshControl()
  let dataManager = DataManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureCollectionView()
    configureRefreshControl()
    
    layoutHeader()
  }
  
  // MARK: - Configurations
  
  fileprivate func configureCollectionView() {
    collectionView.contentInset = UIEdgeInsets(top: (FeedCollectionHeaderView.estimatedHeight - 14 * 3), left: 0, bottom: 0, right: 0)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseId)
    collectionView.register(FeedCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FeedCollectionHeaderView.reuseId)
  }
  
  fileprivate func configureRefreshControl() {
    refreshControl.tintColor = .green
    collectionView.addSubview(refreshControl)
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
  
  // MARK: - UICollectionViewDelegateFlowLayout
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // TODO: This hide animation could be better
    let trueOffset = scrollView.contentOffset.y + 127.0
    
    // print("Beginning offset:", scrollView.contentOffset.y)
    // print("Beginning trueOffset:", trueOffset)
    
    if trueOffset > 100 {
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
        self?.headerView.transform = CGAffineTransform(translationX: 0, y: -trueOffset)
      }
    } else if trueOffset < 100 {
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
        self?.headerView.transform = .identity
      }
    }
  }
  
}

// MARK: - Layout

fileprivate extension FeedViewController {
  
  func layoutHeader() {
    view.addSubview(headerView)
    
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      headerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      headerView.heightAnchor.constraint(equalToConstant: FeedCollectionHeaderView.estimatedHeight)
    ])
  }
  
}
