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
  
  class Coordinator: NSObject, UIPageViewControllerDataSource {
    var parent: PageViewController
    var controllers = [UIViewController]()
    
    init(_ parent: PageViewController) {
      self.parent = parent
      self.controllers = parent.pages.map { UIHostingController(rootView: $0) }
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      
      if index == 0 {
        return controllers.last
      }
      return controllers[index - 1]
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      
      if index == controllers.count - 1 {
        return controllers.first
      }
      return controllers[index + 1]
    }
  }
}

extension PageViewController: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> some UIViewController {
    let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    controller.dataSource = context.coordinator
    return controller
  }
  
  func updateUIViewController(_ controller: UIViewControllerType, context: Context) {
    guard let controller = controller as? UIPageViewController else {
      fatalError("Couldn't cast UIViewController to UIPageViewController")
    }
    
    controller.setViewControllers([context.coordinator.controllers.first!], direction: .forward, animated: true)
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}
