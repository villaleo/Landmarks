//
//  MapView.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/10/23.
//

import MapKit
import SwiftUI

struct MapView: View {
  @State private var region: MKCoordinateRegion = .init()
  
  var coordinate: CLLocationCoordinate2D
  
  var body: some View {
    Map(coordinateRegion: $region)
      .onAppear {
        setRegion(coordinate)
      }
  }
  
  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = .init(
      center: coordinate,
      span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: .init(latitude: 34.011_286, longitude: -116.166_868))
  }
}
