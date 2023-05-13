//
//  Profile.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import Foundation

struct Profile {
  var username: String
  var prefersNotifications = false
  var seasonalPhoto = Season.winter
  var goalDate = Date()

  static let `default` = Profile(username: "villaleobos")

  enum Season: String, CaseIterable, Identifiable {
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"

    var id: String { rawValue }
  }
}
