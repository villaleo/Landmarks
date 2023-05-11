//
//  ModelData.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
  @Published var landmarks: [Landmark] = load("landmarkData.json")
  
  var hikes: [Hike] = load("hikeData.json")
  var categories: [String: [Landmark]] {
    Dictionary(grouping: landmarks, by: { $0.category.rawValue })
  }
}

func load<T>(_ filename: String) -> T
where T: Decodable
{
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  let data: Data
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
