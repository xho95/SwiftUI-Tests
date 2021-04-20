//
//  MainView.swift
//  CoreDataWithMVVM
//
//  Created by Kim, Min Ho on 2020/10/31.
//

import SwiftUI
import CoreData

extension Item {
  static var myFetchRequest: NSFetchRequest<Item> {
    let request: NSFetchRequest<Item> = Item.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)]
    return request
  }
}

struct MainView: View {
    var body: some View {
        NavigationView {
            ContentView(coreData: self)
        }
    }
    
    // MARK: - Core Data
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(fetchRequest: Item.myFetchRequest, animation: .default)
    var items: FetchedResults<Item>

    func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.number = String("\(Int.random(in: 0..<100))")

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func reload() {
        withAnimation {
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }

    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
