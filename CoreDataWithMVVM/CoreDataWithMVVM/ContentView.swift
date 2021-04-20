//
//  ContentView.swift
//  CoreDataWithMVVM
//
//  Created by Kim, Min Ho on 2020/10/31.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var coreData: MainView

    var body: some View {
        List {
            ForEach(coreData.items) { item in
                VStack {
                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    Text("\(item.number ?? "")")
                }
            }
            .onDelete(perform: coreData.deleteItems)
        }
        .navigationTitle(Text("Time Stamps"))
        .navigationBarItems(leading: EditButton())
        .toolbar {
            HStack {
                Button(action: coreData.addItem) {
                    Label("Add Item", systemImage: "plus")
                }
                Button(action: coreData.reload) {
                    Label("Suffle", systemImage: "shuffle")
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreData: MainView())
    }
}
