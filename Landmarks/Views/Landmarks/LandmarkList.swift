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
        ScrollView(.horizontal) {
          TextPill(isOn: $onlyShowFavorites, text: "Show favorites")
            .padding(.top, 3)
            .padding(.bottom, 3)
            .padding(.leading, 3)
        }
        .listRowSeparator(.hidden)
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(onlyShowFavorites: $onlyShowFavorites, landmark: landmark)
          }
        }
        Spacer(minLength: 70)
          .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
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
