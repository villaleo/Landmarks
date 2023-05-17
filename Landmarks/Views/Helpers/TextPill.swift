//
//  TextPill.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/16/23.
//

import SwiftUI

struct TextPill: View {
  @Binding var isOn: Bool
  
  let text: String
  var length: CGFloat {
    CGFloat(text.count * 10)
  }
  
  var body: some View {
    Button {
      isOn.toggle()
    } label: {
      ZStack(alignment: .center) {
        if isOn {
          Capsule()
            .fill(ContentView.appPrimaryColor)
            .frame(width: length, height: 30)
        } else {
          Capsule()
            .stroke(ContentView.appPrimaryColor, lineWidth: 1)
            .frame(width: length, height: 30)
        }
        Text(text)
          .foregroundColor(isOn ? .white : ContentView.appPrimaryColor)
      }
    }
  }
}

struct TextPill_Previews: PreviewProvider {
  static var previews: some View {
    TextPill(isOn: .constant(false), text: "Favorites")
  }
}
