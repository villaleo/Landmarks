//
//  HikeView.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

extension AnyTransition {
  static var slideAndToss: Self {
    .asymmetric(
      insertion: .move(edge: .leading).combined(with: .opacity),
      removal:
        .move(edge: .trailing)
        .combined(with: .move(edge: .top))
        .combined(with: opacity)
    )
  }
}

struct HikeView: View {
  @State private var showDetail = false
  
  var hike: Hike

  var body: some View {
    VStack {
      HStack {
        HikeGraph(hike: hike, path: \.elevation)
          .frame(width: 50, height: 30)

        VStack(alignment: .leading) {
          Text(hike.name)
            .font(.headline)
          Text(hike.distanceText)
        }

        Spacer()
        Button {
          withAnimation {
            showDetail.toggle()
          }
        } label: {
          Label("Graph", systemImage: "chevron.right.circle")
            .labelStyle(.iconOnly)
            .imageScale(.large)
            .rotationEffect(.degrees(showDetail ? 90 : 0))
            .scaleEffect(showDetail ? 1.35 : 1)
            .padding()
        }
      }
      
      if showDetail {
        HikeDetail(hike: hike)
          .transition(.slideAndToss)
      }
    }
  }
}

struct HikeView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HikeView(hike: ModelData().hikes.first!)
        .padding()
      Spacer()
    }
  }
}
