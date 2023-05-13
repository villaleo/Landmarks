//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct CategoryItem: View {
  var item: Landmark
  var body: some View {
    VStack(alignment: .leading) {
      ZStack {
        item.image
          .renderingMode(.original)
          .resizable()
          .frame(width: 155, height: 155)
          .cornerRadius(5)
          .padding(.top)
        
        if item.isFavorite {
          Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.red)
            .shadow(radius: 5)
            .offset(x: 155/2, y: -(155/2) + 10)
        }
      }
      Text(item.name)
        .foregroundColor(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
}

struct CategoryItem_Previews: PreviewProvider {
  static var landmark = ModelData().landmarks[0]
  static var previews: some View {
    CategoryItem(item: landmark)
  }
}
