//
//  PageViewController.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/12/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View> {
  var pages: [Page]
}

extension PageViewController: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> some UIViewController {
    return UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal
    )
  }
  
  func updateUIViewController(_ controller: UIViewControllerType, context: Context) {
    guard let controller = controller as? UIPageViewController else {
      fatalError("Couldn't cast UIViewController to UIPageViewController")
    }
    
    controller.setViewControllers(
      [UIHostingController(rootView: pages.first!)],
      direction: .forward,
      animated: true
    )
  }
}
