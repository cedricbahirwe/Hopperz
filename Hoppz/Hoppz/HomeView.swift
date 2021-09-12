//
//  HomeView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    var body: some View {
        VStack(spacing: 0) {
                        
            Map(coordinateRegion: .constant(.init()))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

