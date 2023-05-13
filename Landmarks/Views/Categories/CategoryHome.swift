//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  @State private var isShowingProfile = false
  
  var body: some View {
    NavigationStack {
      List {
        PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
          .aspectRatio(3 / 2, contentMode: .fit)
          .listRowInsets(EdgeInsets())
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.categories[key]!)
        }
      }
      .listStyle(.inset)
      .navigationTitle("Featured")
      .toolbar {
        Button {
          isShowingProfile.toggle()
        } label: {
          Label("User Profile", systemImage: "person.crop.circle")
            .scaleEffect(x: 1.35, y: 1.35)
            .padding()
        }
      }
      .sheet(isPresented: $isShowingProfile) {
        ProfileHost()
          .environmentObject(modelData)
      }
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var modelData = ModelData()
  static var previews: some View {
    CategoryHome()
      .environmentObject(modelData)
  }
}
