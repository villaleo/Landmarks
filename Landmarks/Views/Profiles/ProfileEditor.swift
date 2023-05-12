//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Leonardo Villalobos on 5/12/23.
//

import SwiftUI

struct ProfileEditor: View {
  @Binding var profile: Profile
  
  var dateRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
    let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
    return min...max
  }
  
  var body: some View {
    List {
      HStack {
        Text("Username")
          .bold()
        Divider()
        TextField("Username", text: $profile.username)
          .padding(.leading)
      }
      
      Toggle(isOn: $profile.prefersNotifications) {
        Text("Enable Notifications")
          .bold()
        Text("For landmark-related events")
          
      }
      
      VStack(alignment: .leading) {
        Text("Seasonal Photo")
          .bold()
        Text("What's your preferred season?")
          .font(.subheadline)
          .foregroundColor(.secondary)
        Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
          ForEach(Profile.Season.allCases) { season in
            Text(season.rawValue).tag(season)
          }
        }
        .pickerStyle(.segmented)
      }
      
      DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
        Text("Goal Date")
          .bold()
        Text("By when would you like to visit a landmark?")
      }
    }
  }
}

struct ProfileEditor_Previews: PreviewProvider {
  static var previews: some View {
    ProfileEditor(profile: .constant(.default))
  }
}
