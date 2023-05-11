//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var modelData: ModelData
  @State private var onlyShowFavorites = false
  
  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { !onlyShowFavorites || $0.isFavorite }
  }
  
  var body: some View {
    NavigationStack {
      List {
        Toggle(isOn: $onlyShowFavorites) {
          Text("Favorites only")
        }
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
      }
      .navigationTitle("Landmarks")
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var modelData = ModelData()
  static var previews: some View {
    LandmarkList()
      .environmentObject(modelData)
  }
}
