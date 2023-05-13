//
//  ContentView.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab: Tab = .list
  
  init() {
    UITabBar.appearance().isHidden = true
  }
  
  var body: some View {
    ZStack {
      VStack {
        TabView(selection: $selectedTab) {
          LandmarkList()
            .tag(Tab.list)
          CategoryHome()
            .tag(Tab.featured)
        }
      }
        
      VStack {
        Spacer()
        NavBar(selectedTab: $selectedTab)
          .shadow(radius: 15)
      }
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
