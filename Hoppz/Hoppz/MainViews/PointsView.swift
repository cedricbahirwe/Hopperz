//
//  PointsView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 14/09/2021.
//

import SwiftUI

struct PointsView: View {
    @Environment(\.presentationMode)
    private var presentationMode
    
    var body: some View {
        VStack {
            Text("Hoppz")
                .textCase(.uppercase)
                .font(.largeTitle.bold())
                .foregroundColor(.mainGreen)
                .frame(maxWidth: .infinity)
                .overlay(
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .frame(width:40, height: 40)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(Circle())
                            .foregroundColor(.primary)
                        
                    })
                    , alignment: .leading
                )
                .padding(10)

            ScrollView {
                VStack(spacing: 25) {
                    HStack {
                        Text("Points").bold()
                        Spacer()
                    }
                    
                    LinearGradient(gradient: Gradient(colors: [Color.yellow,.yellow.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottom)
                        .mask (
                            Image(systemName: "h.square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .accentColor(.blue)
                                .foregroundColor(.red)
                        )
                        .frame(width: 120, height: 120)
                        .background(Color.mainGreen.cornerRadius(18))
                    
                    
                    
                    VStack {
                        Text("2500")
                            .font(.largeTitle.bold())
                        Text("Points Earned").bold()
                    }
                    .opacity(0.8)
                }
                .padding(10)
                
                VStack  {
                    
                    ForEach(1..<10) { i in
                        HStack {
                            Text("+\(i*100)")
                                .font(.title2.weight(.semibold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.6)
                                .frame(width: 80)
                            VStack(alignment: .leading) {
                                Text("Interact with Hoppz notifications")
                                    .bold()
                                Text("Interact with Hoppz notifications")
                                    .fontWeight(.light)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(6)
                        .overlay(Color.white.frame(height: 0.6),
                                 alignment: .bottom)
                    }
                    
                }
                
                .background(Color.mainGreen.opacity(0.6))
                .cornerRadius(15)
                
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
    }
}
