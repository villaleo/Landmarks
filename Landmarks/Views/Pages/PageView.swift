//
//  PageView.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/12/23.
//

import SwiftUI

struct PageView<Page: View>: View {
  var pages: [Page]
  @State private var currentPageIndex = 0
  
  var body: some View {
    PageViewController(pages: pages, currentPageIndex: $currentPageIndex)
  }
}

struct PageView_Previews: PreviewProvider {
  static var features = ModelData().features
  static var previews: some View {
    PageView(pages: features.map { FeatureCard(landmark: $0) })
      .aspectRatio(3 / 2, contentMode: .fit)
  }
}
