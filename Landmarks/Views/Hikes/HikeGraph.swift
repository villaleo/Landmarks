//
//  HikeGraph.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct HikeGraph: View {
  var hike: Hike
  var path: KeyPath<Hike.Observation, Range<Double>>

  var color: Color {
    switch path {
    case \.elevation:
      return Color(hue: 0.5, saturation: 0.8, brightness: 0.8)
    case \.heartRate:
      return Color(hue: 0, saturation: 0.8, brightness: 0.8)
    case \.pace:
      return Color(hue: 0.8, saturation: 0.8, brightness: 0.8)
    default:
      return .black
    }
  }

  var body: some View {
    let data = hike.observations
    let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
    let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
    let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

    return GeometryReader { proxy in
      HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
        ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
          GraphCapsule(
            index: index,
            color: color,
            height: proxy.size.height,
            range: observation[keyPath: path],
            overallRange: overallRange
          )
        }
        .offset(x: 0, y: proxy.size.height * heightRatio)
      }
    }
  }
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
where C.Element == Range<Double>
{
  guard !ranges.isEmpty else {
    return 0..<0
  }
  
  let low = ranges.lazy.map { $0.lowerBound }.min()!
  let high = ranges.lazy.map { $0.upperBound }.max()!
  return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
  range.upperBound - range.lowerBound
}

struct HikeGraph_Previews: PreviewProvider {
  static var hike = ModelData().hikes.first!

  static var previews: some View {
    Group {
      HikeGraph(hike: hike, path: \.elevation)
        .frame(height: 200)
        .previewDisplayName("Elevation")
      HikeGraph(hike: hike, path: \.heartRate)
        .frame(height: 200)
        .previewDisplayName("Heart Rate")
      HikeGraph(hike: hike, path: \.pace)
        .frame(height: 200)
        .previewDisplayName("Pace")
    }
  }
}
