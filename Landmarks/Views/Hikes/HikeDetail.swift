//
//  HikeDetail.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct HikeDetail: View {
  @State var dataToShow = \Hike.Observation.elevation
  
  let hike: Hike

  var buttons = [
    ("Elevation", \Hike.Observation.elevation),
    ("Heart Rate", \Hike.Observation.heartRate),
    ("Pace", \Hike.Observation.pace)
  ]

  var body: some View {
    VStack {
      HikeGraph(hike: hike, path: dataToShow)
        .frame(height: 200)
        .padding()
      Divider()
      HStack(spacing: 25) {
        ForEach(buttons, id: \.0) { value in
          Button {
            dataToShow = value.1
          } label: {
            Text(value.0)
              .font(.system(size: 15))
              .foregroundColor(value.1 == dataToShow ? .gray: .accentColor)
              .animation(nil)
          }
        }
      }
    }
  }
}

struct HikeDetail_Previews: PreviewProvider {
  static var previews: some View {
    HikeDetail(hike: ModelData().hikes.first!)
  }
}
