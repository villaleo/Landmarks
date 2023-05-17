//
//  FavoritesButton.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct MarkAsFavorite: View {
  @Binding var isSet: Bool
  
  var body: some View {
    Button {
      withAnimation(.default) {
        isSet.toggle()
      }
    } label: {
      Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
        .labelStyle(.iconOnly)
        .foregroundColor(isSet ? .red : .gray)
        .scaleEffect(x: isSet ? 1.5 : 1, y: isSet ? 1.5 : 1)
    }
  }
}

struct MarkAsFavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
    MarkAsFavorite(isSet: .constant(true))
  }
}
