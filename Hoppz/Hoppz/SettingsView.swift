//
//  SettingsView.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 2) {
                
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .padding(10)
                    .frame(width: 80, height: 80)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color.green, lineWidth: 2))
                    .padding(.vertical, 20)
                
                Divider()
                
                
                Button(action: {
                    
                }, label: {
                    Text("Invite a Hopper")
                        .font(.callout.weight(.semibold))
                        .foregroundColor(.green)
                        .frame(height: 35)
                })
                
                Divider()

                Group {
                    
                    
                    formButton("Get Help") { }
                    
                    Divider()
                    
                    formButton("Manage bloack Hopperz") { }
                    
                    Divider()
                }
                
                
                Group {
                    formButton("Terms of Service") { }
                    
                    Divider()
                    
                    formButton("Privacy Policy") { }
                    
                    Divider()
                    
                    formButton("Reset Password") { }
                    
                    Divider()
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Log out")
                        .font(.caption.weight(.light))
                        .foregroundColor(.green)
                        .frame(height: 35)
                })
                
            }
            .padding(.horizontal)
            
            Spacer(minLength: 0)
        }
        .background(Color(.secondarySystemBackground))
    }
    
    private func formButton(_ title: String,
                            action: @escaping() -> ())-> some View {
        
        Button(action: action, label: {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 35)
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
