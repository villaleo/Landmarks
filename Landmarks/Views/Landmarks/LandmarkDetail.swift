//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  @State private var tappedImage = false
  
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
        .scaleEffect(x: tappedImage ? 1.05 : 1, y: tappedImage ? 1.05 : 1)
        .onTapGesture {
          withAnimation(.easeOut(duration: 0.25)) {
            tappedImage.toggle()
          }
        }
      
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoritesButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            .shadow(radius: 3)
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
