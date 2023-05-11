//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Landmark]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(items) { landmark in
            NavigationLink {
              LandmarkDetail(landmark: landmark)
            } label: {
              CategoryItem(item: landmark)
            }
          }
        }
      }
      .frame(height: 185)
    }
  }
}

struct CategoryRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks
  static var previews: some View {
    CategoryRow(
      categoryName: landmarks.first!.category.rawValue,
      items: Array(landmarks.prefix(upTo: 4))
    )
  }
}
