//
//  ReduxLikeApp.swift
//  ReducLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

// https://danielbernal.co/redux-like-architecture-with-swiftui-basics/
// https://danielbernal.co/redux-like-architecture-with-swiftui-middleware/

import SwiftUI

@main
struct ReduxLikeApp: App {
    @StateObject var store = AppStore(state: .init(animal: Animal()),
                                      reducer: appReducer,
                                      middlewares: [
                                        animalMiddleware(service: AnimalService())
                                      ])
    
    var body: some Scene {
        WindowGroup {
            AnimalView()
                .environmentObject(store)
        }
    }
}
