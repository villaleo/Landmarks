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
          VStack {
            Image(systemName: selectedTab == tab ? filledTabImage : tab.rawValue)
              .scaleEffect(selectedTab == tab ? 1.8 : 1.5)
              .onTapGesture {
                withAnimation(.easeIn(duration: 0.25)) {
                  selectedTab = tab
                }
            }
            switch tab {
            case .featured:
              Text("Featured")
                .font(.caption)
                .padding(.top)
            case .list:
              Text("Landmarks")
                .font(.caption)
                .padding(.top)
            }
          }
          Spacer()
        }
      }
      .frame(width: nil, height: 80)
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
