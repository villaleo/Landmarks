//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(3)
        .shadow(radius: 2.5)
      Text(landmark.name)
      Spacer()
      if landmark.isFavorite {
        Image(systemName: "heart.fill")
          .resizable()
          .frame(width: 15, height: 15)
          .shadow(radius: 2)
          .foregroundColor(ContentView.appPrimaryColor)
      }
    }
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks
  static var previews: some View {
    LandmarkRow(landmark: landmarks.first!)
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
