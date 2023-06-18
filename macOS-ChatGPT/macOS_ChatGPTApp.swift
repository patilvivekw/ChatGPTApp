//
//  macOS_ChatGPTApp.swift
//  macOS-ChatGPT
//
//  Created by Patil, Vivek on 18/06/23.
//

import SwiftUI

@main
struct macOS_ChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
