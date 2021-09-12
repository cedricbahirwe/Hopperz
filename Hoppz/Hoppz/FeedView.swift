//
//  FeedView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {            
            Section(header:
                        Text("Feed")
                        .font(.title2.bold())
                        .padding()
            ) {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0 ..< 10) { item in
                            HStack(alignment: .top, spacing: 20) {
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(5)
                                    .frame(width: 25, height: 25)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                Text("Congrats, you've earned +100 points")
                                    .fontWeight(.light)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(item < 2 ? Color.green : .clear)
                        }
                    }
                }
            }
            Spacer()
        }
        .background(Color(.secondarySystemBackground).ignoresSafeArea())
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
