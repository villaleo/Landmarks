//
//  Landmark.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Codable, Hashable, Identifiable {
  typealias ID = Int
  
  var id:          ID
  var name:        String
  var park:        String
  var state:       String
  var description: String
  var isFavorite:  Bool
  var isFeatured:  Bool
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case lakes     = "Lakes"
    case rivers    = "Rivers"
    case mountains = "Mountains"
  }
  
  private var imageName: String
  
  var image: Image {
    Image(imageName)
  }
  
  private var coordinates: Coordinates
  
  var location: CLLocationCoordinate2D {
    .init(latitude: coordinates.latitude, longitude: coordinates.longitude)
  }
  
  struct Coordinates: Codable, Hashable {
    var latitude:  Double
    var longitude: Double
  }
}
