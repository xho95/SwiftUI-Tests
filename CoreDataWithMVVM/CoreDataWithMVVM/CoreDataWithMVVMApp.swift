//
//  CoreDataWithMVVMApp.swift
//  CoreDataWithMVVM
//
//  Created by Kim, Min Ho on 2020/10/31.
//

import SwiftUI

@main
struct CoreDataWithMVVMApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {        
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
