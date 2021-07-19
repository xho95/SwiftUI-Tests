//
//  AppStore.swift
//  ReduxSelf (iOS)
//
//  Created by Kim, Min Ho on 2021/07/19.
//

import Foundation
import Combine

typealias ReduxOperatorStore = AppStore<AppState>

class AppStore<State>: ObservableObject where State: Statable {
    typealias Action = State.Action
    
    @Published private(set) var state: State
    
    private let queue = DispatchQueue(
        label: "com.xho95.ReduxSelf.store",
        qos: .userInitiated
    )
    
    private let middlewares: [Middleware<State, Action>]
    
    private var subscriptons: Set<AnyCancellable> = []
    
    init(initial: State,
         middlewares: [Middleware<State, Action>] = []) {
        self.state = initial
        self.middlewares = middlewares
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = state.reducer(currentState, action)
        state = newState
        
        middlewares.forEach { middleware in
            let publisher = middleware(newState, action)
            
            publisher
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &subscriptons)
        }
    }
}
