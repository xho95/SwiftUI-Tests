//
//  OrderSheet.swift
//  CoreDataTest
//
//  Created by Kim, Min Ho on 2020/10/30.
//

import SwiftUI

struct OrderSheet: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode

    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pizza Details")) {
                    Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type")) {
                        ForEach(0..<pizzaTypes.count) {
                            Text(self.pizzaTypes[$0]).tag($0)
                        }
                    }
                    
                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                }
                
                Section(header: Text("Table")) {
                    TextField("Table Number", text: $tableNumber)
                        .keyboardType(.numberPad)
                }
                
                Button {
                    guard self.tableNumber != "" else { return }
                    
                    let newOrder = Order(context: viewContext)
                    newOrder.pizzaType = pizzaTypes[selectedPizzaIndex]
                    newOrder.orderStatus = .pending
                    newOrder.tableNumber = tableNumber
                    newOrder.numberOfSlices = Int16(self.numberOfSlices)
                    newOrder.id = UUID()
                    
                    do {
                        try viewContext.save()
                        print("Order saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                } label: {
                    Text("Add Order")
                }
            }
            .navigationTitle("Add Order")
        }
    }
}

struct OrderSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheet()
    }
}
