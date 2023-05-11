//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
      NavigationStack {
        List(landmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
        .navigationTitle("Landmarks")
      }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
      ForEach(["iPad Air (5th generation)", "iPhone 14 Pro"], id: \.self) { deviceName in
        LandmarkList()
          .previewDevice(.init(rawValue: deviceName))
          .previewDisplayName(deviceName)
      }
    }
}
