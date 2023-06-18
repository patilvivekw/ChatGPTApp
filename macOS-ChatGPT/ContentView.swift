//
//  ContentView.swift
//  macOS-ChatGPT
//
//  Created by Patil, Vivek on 18/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            // SideBar
            HistoryView()
        } detail: {
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
            .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
    }
}
