//
//  HomeView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -1.9398097, longitude: 30.0743916), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        ZStack { //}(alignment: .bottom) {
                        
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            ModalAnchorView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModalManager())
    }
}

