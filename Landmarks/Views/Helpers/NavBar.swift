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
  
  private static var lightGray = Color(uiColor: .lightGray)
  
  var body: some View {
    VStack {
      HStack {
        ForEach(Tab.allCases, id: \.rawValue) { tab in
          Spacer()
          VStack {
            Image(systemName: selectedTab == tab ? filledTabImage : tab.rawValue)
              .resizable()
              .frame(width: 12.5, height: 12.5)
              .scaleEffect(selectedTab == tab ? 1.8 : 1.5)
              .foregroundColor(selectedTab == tab ? ContentView.appPrimaryColor : Self.lightGray)
            Text(textForSelected(tab))
              .font(.caption)
              .foregroundColor(selectedTab == tab ? ContentView.appPrimaryColor : Self.lightGray)
              .padding(.top, 5)
          }
          .shadow(radius: selectedTab == tab ? 3 : 0)
          .offset(y: 5)
          .onTapGesture {
            withAnimation(.default) {
              selectedTab = tab
            }
          }
          Spacer()
        }
      }
      .frame(width: nil, height: 70)
      .background(.thickMaterial)
    }
  }
  
  private func textForSelected(_ tab: Tab) -> String {
    switch tab {
    case .featured:
      return "Featured"
    case .list:
      return "Landmarks"
    }
  }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
      NavBar(selectedTab: .constant(.featured))
    }
}
