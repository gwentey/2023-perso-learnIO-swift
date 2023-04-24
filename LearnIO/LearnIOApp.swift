//
//  LearnIOApp.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI

@main
struct LearnIOApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
