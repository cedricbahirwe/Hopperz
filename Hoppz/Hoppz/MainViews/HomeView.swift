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
    
    @StateObject var modalManager = ModalManager()
    var body: some View {
        ZStack {
            
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            ModalView(modal: $modalManager.modal)
            
        }
        .clipped()
        .onAppear(){
            modalManager.newModal(position: .partiallyRevealed) {
                exploreView
            }
        }
    }
    private var exploreView: some View {
        VStack(alignment: .leading) {
            Text("Explore")
                .font(.largeTitle.weight(.semibold))
                .opacity(0.9)
                .padding()
            Text("No Establishments Nearby").bold()
                .padding()
                .frame(maxWidth: .infinity)
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0 ..< 5) { item in
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .background(Color(.systemBackground))
                                .clipShape(Circle())
                                .overlay(Circle().strokeBorder(Color.mainGreen, lineWidth: 1))
                            
                            VStack(alignment: .leading) {
                                Text("Alexander Bahirwe").bold()
                                    .foregroundColor(.mainGreen)
                                
                                Text("ABC University")
                                    .font(.caption)
                                
                            }
                            Spacer()
                            
                            Label(
                                title: {
                                    Text("\((500...15000).randomElement()!)")
                                        .foregroundColor(.mainGreen)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.9)
                                        .frame(maxWidth: 58)
                                },
                                icon: {
                                    Image(systemName: "staroflife.circle.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.yellow)
                                        .offset(x: 8)
                                }
                            )
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .overlay(Color.gray.frame(height: 0.5), alignment: .bottom)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            HomeView()
                .environmentObject(ModalManager())
            TabBarView(selection: .constant(2))
        }
    }
}

