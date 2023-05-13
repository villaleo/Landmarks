//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  
  var landmark: Landmark
  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.location)
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
        
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoritesButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
        }
        
        HStack {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Divider()
        Text("About \(landmark.name)")
          .font(.title2)
        Spacer()
        Text(landmark.description)
        Spacer(minLength: 70)
      }
      .padding()
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var modelData = ModelData()
  static var previews: some View {
    LandmarkDetail(landmark: modelData.landmarks.first!)
      .environmentObject(modelData)
  }
}
