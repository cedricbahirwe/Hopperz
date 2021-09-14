//
//  TopHeaderView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI

struct TopHeaderView: View {
    var body: some View {
        Text("Hoppz")
            .textCase(.uppercase)
            .font(.largeTitle.bold())
            .foregroundColor(.green)
            .frame(maxWidth: .infinity)
            .overlay(
                NavigationLink(
                    destination: PointsView()) {
                    Label(
                        title: {
                            Text("1030")
                                .foregroundColor(.green)
                        },
                        icon: {
                            Image(systemName: "staroflife.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.yellow)
                        }
                    )
                }
                , alignment: .leading
            )
            .padding(10)
    }
}


struct TopHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeaderView()
    }
}
