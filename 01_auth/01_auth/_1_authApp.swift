//
//  _1_authApp.swift
//  01_auth
//
//  Created by Vladlen on 15.10.2023.
//

import SwiftUI
import SwiftData
import LinkNavigator

@main
struct _1_authApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var navigator: LinkNavigator {
      appDelegate.navigator
    }

    var body: some Scene {
        WindowGroup {
            navigator
              .launch(paths: ["Login"], items: [:])
              .onOpenURL { url in
              // in case you need deep link navigation,
              // deep links should be processed here.
              }
          }
        .modelContainer(sharedModelContainer)
    }
}
