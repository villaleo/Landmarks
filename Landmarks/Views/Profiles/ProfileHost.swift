//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/11/23.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @EnvironmentObject var modelData: ModelData
  @State private var draftProfile = Profile.default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        Spacer()
        EditButton()
      }
      
      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: modelData.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
      }
    }
    .padding()
  }
}

struct ProfileHost_Previews: PreviewProvider {
  static var modelData = ModelData()
  static var previews: some View {
    ProfileHost()
      .environmentObject(modelData)
  }
}
