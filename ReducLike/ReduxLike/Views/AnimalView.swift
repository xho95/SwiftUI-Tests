//
//  AnimalView.swift
//  ReducLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import SwiftUI

struct AnimalView: View {
    @EnvironmentObject var store: AppStore

    var body: some View {
        let shouldDisplayError = Binding<Bool>(
            get: { store.state.animal.fetchError != nil },
            set: { _ in store.dispatch(.animal(action: .fetchError(error: nil))) }
        )

        VStack {
            if store.state.animal.fetchInProcess {
                ProgressView("Fetching Animal...")
            } else {
                Text(store.state.animal.current)
                    .font(.system(.largeTitle))
                    .padding()
                
                Button {
                    loadAnimal()
                } label: {
                    Text("Tap me")
                }
            }
        }
        .onAppear {
           loadAnimal()
        }
        .alert(isPresented: shouldDisplayError) {
            Alert(
                title: Text("An error has Occured"),
                message: Text(store.state.animal.fetchError ?? ""),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
    
    private func loadAnimal() {
        store.dispatch(.animal(action: .fetch))
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}
