//
//  CoreDataManager.swift
//  ChatGPTApp
//
//  Created by Patil, Vivek on 18/06/23.
//

import Foundation
import CoreData


class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "HistoryModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core data store failed \(error.localizedDescription)")
            }
        }
    }
}
