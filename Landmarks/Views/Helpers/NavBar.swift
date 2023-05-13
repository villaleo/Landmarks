//
//  NavView.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/12/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
  case list = "rectangle.grid.1x2"
  case featured = "star"
}

struct NavBar: View {
  @Binding var selectedTab: Tab
  
  private var filledTabImage: String {
    selectedTab.rawValue + ".fill"
  }
  
  var body: some View {
    VStack {
      HStack {
        ForEach(Tab.allCases, id: \.rawValue) { tab in
          Spacer()
          Image(systemName: selectedTab == tab ? filledTabImage : tab.rawValue)
            .scaleEffect(selectedTab == tab ? 1.5 : 1)
            .onTapGesture {
              withAnimation(.easeIn(duration: 0.25)) {
                selectedTab = tab
              }
            }
          Spacer()
        }
      }
      .frame(width: nil, height: 60)
      .background(.thinMaterial)
      .cornerRadius(10)
      .padding()
    }
  }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
      NavBar(selectedTab: .constant(.featured))
    }
}
