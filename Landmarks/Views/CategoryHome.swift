//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.categories[key]!)
        }
      }
        .navigationTitle("Featured")
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
