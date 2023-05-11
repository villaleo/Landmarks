//
//  FavoritesButton.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import SwiftUI

struct FavoritesButton: View {
  @Binding var isSet: Bool
  
  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
        .labelStyle(.iconOnly)
        .foregroundColor(isSet ? .red : .gray)
    }
  }
}

struct FavoritesButton_Previews: PreviewProvider {
  static var previews: some View {
    FavoritesButton(isSet: .constant(true))
  }
}
