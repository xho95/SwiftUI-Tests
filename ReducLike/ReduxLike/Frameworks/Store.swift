//
//  Store.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation
import Combine

typealias AppStore = Store<State, Action>
typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware<State, Action>]
    private var middlewareCancellables: Set<AnyCancellable> = []
    
    private let serialQueue = DispatchQueue(label: "redux.serial.queue")
    
    var tasks = [AnyCancellable]()
    
    init(state: State,
         reducer: @escaping Reducer<State, Action>,
         middlewares: [Middleware<State, Action>] = []) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
        
        for middleware in middlewares {
            guard let middleware = middleware(state, action) else { break }
            
            middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middlewareCancellables)
        }
    }
}
