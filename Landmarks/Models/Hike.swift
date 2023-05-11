//
//  Hike.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
  typealias ID = Int
  
  var id: Int
  var name: String
  var distance: Double
  var difficulty: Int
  var observations: [Observation]
  
  static var formatter = LengthFormatter()
  
  var distanceText: String {
    Hike.formatter
      .string(fromValue: distance, unit: .mile)
  }
  
  struct Observation: Codable, Hashable {
    var distanceFromStart: Double
    var elevation: Range<Double>
    var pace: Range<Double>
    var heartRate: Range<Double>
  }
}
