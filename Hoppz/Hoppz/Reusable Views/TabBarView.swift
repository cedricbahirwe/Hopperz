//
//  TabBarView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selection: Int
    var body: some View {
        HStack {
            
            tabItem("Feed", icon: "bell", index: 1)
            
            Spacer()
            
            tabItem("Home", icon: "house", index: 2)
            
            Spacer()
            
            tabItem("Settings", icon: "gear", index: 3)
            
        }
        .padding([.horizontal, .bottom])
        
    }
    
    private func tabItem(_ title: String,
                         icon: String,
                         index: Int) -> some View {
        
        Button(action: {
            selection = index
        }, label: {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(index==selection ? .mainGreen : .secondary)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.top)
            .frame(width: 70)
            .overlay(
                Color.mainGreen.opacity(index==selection ? 1 : 0)
                    .frame(height: 5)
                , alignment: .top
            )
        })

    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(2))
    }
}
