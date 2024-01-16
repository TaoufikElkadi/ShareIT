//
//  ShareItApp.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 18/11/2023.
//

import SwiftUI

@main
struct ShareItApp: App {
    @StateObject var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            WelcomeScreenView()
                .environmentObject(appViewModel)
        }
    }
}
