//
//  ContentView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                TopHeaderView()
                ContainerView(selectedTab: $selectedTab)
                TabBarView(selection: $selectedTab)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContainerView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        
        switch selectedTab {
        case 1:
            FeedView()
        case 2:
            HomeView()
        case 3: SettingsView()
        default:
            EmptyView()
        }
    }
}
