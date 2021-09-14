//
//  FeedView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI


private struct FeedItem: Identifiable {
    let id = UUID()
    let message: String
    var isSeen = false
    
    static private let example = FeedItem(message: "Congrats, you've earned +100 points")
    
    static let examples = (1...10).map { i in
        FeedItem(message: example.message, isSeen: i%2==1)
        
    }
}
struct FeedView: View {
    @State private var feed: [FeedItem] = FeedItem.examples
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {            
            Section(header:
                        Text("Feed")
                        .font(.title2.bold())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemFill))
            ) {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(feed) { item in
                            HStack(alignment: .top, spacing: 20) {
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(5)
                                    .frame(width: 25, height: 25)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                Text(item.message)
                                    .fontWeight(.light)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(item.isSeen ? Color.clear : .mainGreen)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    let i = feed.firstIndex(where: { $0.id == item.id })!
                                    feed[i].isSeen.toggle()
                                }
                            }
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
//            .preferredColorScheme(.dark)
    }
}
