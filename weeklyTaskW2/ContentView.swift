//
//  ContentView.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()
    var body: some View {
        // the tabview to show the pages i have
        TabView {
                   HomeView(settingsViewModel: settingsViewModel)
                       .tabItem {
                           Label("Home", systemImage: "house")
                       }
                   
                   NavigationStack {
                       SettingsView(settingsViewModel: settingsViewModel)
                   }
                   .tabItem {
                       Label("Settings", systemImage: "gear")
                   }
               }
               .preferredColorScheme(settingsViewModel.isDarkMode ? .dark : .light) 
           }
    }

#Preview {
    ContentView()
}
