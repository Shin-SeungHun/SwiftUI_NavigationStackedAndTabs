//
//  NavigationStackedAndTabsApp.swift
//  NavigationStackedAndTabs
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

@main
struct NavigationStackedAndTabsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationPathFinder.shared)
        }
    }
}
