//
//  iCaloriesApp.swift
//  iCalories
//
//  Created by Zeynep Sevgi on 22.02.2024.
//

import SwiftUI

@main
struct iCaloriesApp: App {
    @StateObject private var dataController = DataController() //veritabanını enjekte ettik
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
