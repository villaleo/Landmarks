//
//  PageControl.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/12/23.
//

import SwiftUI
import UIKit

struct PageControl {
  var numberOfPages: Int
  @Binding var currentPageIndex: Int
  
  class Coordinator: NSObject {
    var control: PageControl
    
    init(_ control: PageControl) {
      self.control = control
    }

    @objc
    func updateCurrentPage(sender: UIPageControl) {
      control.currentPageIndex = sender.currentPage
    }
  }
}

extension PageControl: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    let control = UIPageControl()
    control.numberOfPages = numberOfPages
    control.addTarget(
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged
    )
    return control
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    guard let pageControl = uiView as? UIPageControl else {
      fatalError("Couldn't cast UIView to UIPageControl")
    }
    
    pageControl.currentPage = currentPageIndex
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}
