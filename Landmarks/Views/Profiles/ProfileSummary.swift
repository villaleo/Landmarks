//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct ProfileSummary: View {
  @EnvironmentObject var modelData: ModelData
  
  var profile: Profile
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text("\(profile.username) \(profile.seasonalPhoto.rawValue)")
          .bold()
          .font(.title)
        Text("Visit a Landmark by: ") + Text(profile.goalDate, style: .date).italic()
        Divider()
        
        VStack(alignment: .leading) {
          Text("Completed Badges")
            .font(.headline)
          
          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: -65))
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5)
                .hueRotation(Angle(degrees: 100))
            }
            .padding(.bottom)
          }
        }
        
        Divider()
        VStack(alignment: .leading) {
          Text("Recent Hikes")
            .font(.headline)
          HikeView(hike: modelData.hikes.first!)
        }
      }
    }
  }
}

struct ProfileSummary_Previews: PreviewProvider {
  static var profile = Profile.default
  static var modelData = ModelData()
  static var previews: some View {
    ProfileSummary(profile: profile)
      .environmentObject(modelData)
  }
}
