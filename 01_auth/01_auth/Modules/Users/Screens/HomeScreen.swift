//
//  ContentView.swift
//  01_auth
//
//  Created by Vladlen on 15.10.2023.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    let params: [String: String]
    
    @State private var users: [User] = []
    
    func load() async {
        do {
            users = try await UsersModel().getUsers()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        List {
            ForEach(users) { item in
                HStack {
                    Text(item.fullName)
                    Spacer()
                    Text(item.rating)
                }
            }.swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button(role: .destructive, action: {}, label: {Label("Delete", systemImage: "trash")})
            }
        }
        .navigationTitle("Welcome, \(params["name"] ?? "")")
        .navigationBarTitleDisplayMode(.large)
//        .toolbar { EditButton() }
        .task {
            await load()
        }
        .refreshable {
            await load()
        }
        .overlay {
            if users.isEmpty { ProgressView() }
        }
    }
}
