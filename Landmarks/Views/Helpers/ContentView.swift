//
//  ContentView.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab: Tab = .list
  
  enum Tab {
    case list
    case featured
  }
  
  var body: some View {
      TabView(selection: $selectedTab) {
        LandmarkList()
          .tabItem {
            Label("List", systemImage: "rectangle.grid.1x2")
          }
          .tag(Tab.list)
        CategoryHome()
          .tabItem {
            Label("Featured", systemImage: "star")
          }
          .tag(Tab.featured)
      }
    }
  }

struct ContentView_Previews: PreviewProvider {
  static var modelData = ModelData()
  static var previews: some View {
    ContentView()
      .environmentObject(modelData)
  }
}
