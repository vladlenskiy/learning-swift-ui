//
//  AuthView.swift
//  SwiftUI_01
//
//  Created by Vladlen on 15.10.2023.
//

import Foundation
import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .padding(.horizontal, 4)
            }
            content
                .foregroundColor(Color.white)
                .padding(5.0)
        }
    }
}


struct AuthView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("Sing In")
                    .foregroundColor(.purple)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "",
                    text: $email
                )
                .modifier(PlaceholderStyle(showPlaceHolder: email.isEmpty,
                                           placeholder: "E-mail"))
                .padding(10)
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .background(.gray)
                .cornerRadius(6)
                
                TextField(
                    "",
                    text: $password
                )
                .modifier(PlaceholderStyle(showPlaceHolder: password.isEmpty,
                                           placeholder: "Password"))
                .padding(10)
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .background(.gray)
                .cornerRadius(6)
                
                Button(action: {
                    // Handle button tap here
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(.linearGradient(Gradient.init(colors: [.white, Color.purple]), startPoint: UnitPoint(x: 0, y: 5), endPoint: UnitPoint(x: 1, y: 1)))
                        .cornerRadius(14)
                }
                
            }.padding([.horizontal])
            
        }
    }
}

#Preview {
    AuthView()
        .modelContainer(for: Item.self, inMemory: true)
}

