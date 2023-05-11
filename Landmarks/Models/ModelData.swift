//
//  ModelData.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

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
