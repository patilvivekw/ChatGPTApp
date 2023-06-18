//
//  iOS_ChatGPTApp.swift
//  iOS-ChatGPT
//
//  Created by Patil, Vivek on 18/06/23.
//

import SwiftUI

@main
struct iOS_ChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
