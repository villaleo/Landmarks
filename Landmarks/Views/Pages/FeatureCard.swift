//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/12/23.
//

import SwiftUI

struct FeatureCard: View {
  var landmark: Landmark
  
  var body: some View {
    landmark.featureImage?
      .resizable()
      .aspectRatio(3 / 2, contentMode: .fit)
      .overlay {
        TextOverlay(landmark: landmark)
      }
  }
}

struct TextOverlay: View {
  var landmark: Landmark
  
  var gradient: LinearGradient {
    .linearGradient(
      colors: [.black.opacity(0.6), .black.opacity(0)],
      startPoint: .bottom,
      endPoint: .center
    )
  }
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      gradient
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
          .bold()
        Text(landmark.park)
      }
      .padding()
    }
    .foregroundColor(.white)
  }
}

struct FeatureCard_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks
  static var previews: some View {
    FeatureCard(landmark: landmarks.first!)
  }
}
