//
//  Movie_EveningApp.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI
import SwiftData

@main
struct Movie_EveningApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
