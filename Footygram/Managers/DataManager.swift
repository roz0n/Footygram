//
//  DataManager.swift
//  Footygram
//
//  Created by Arnaldo Rozon on 5/30/21.
//

import Foundation

class DataManager {
  
  let endpoint = "https://www.notenough.science/footygram/"
  let totalImageCount = 198
  
  func fetchImage(id: Int) -> Data? {
    guard let url = URL(string: "\(endpoint)/\(String(id)).jpeg") else { return nil }
    
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch let error {
      print("\(error) \(error.localizedDescription)")
      return nil
    }
  }
  
  func saveImage() {}
  
  func getImage() {}
  
  func deleteImage() {}
  
}
