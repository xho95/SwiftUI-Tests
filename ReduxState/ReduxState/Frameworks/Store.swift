//
//  Store.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation
import Combine

typealias AppStore = Store<AppState, AppAction, World>

final class Store<State, Action, Environment>: ObservableObject {
    @Published private(set) var state: State
    
    private let environment: Environment
    private let reducer: Reducer<State, Action, Environment>
    private var cancellables: Set<AnyCancellable> = []
    
    init(state: State, reducer: @escaping Reducer<State, Action, Environment>, environment: Environment) {
        self.state = state
        self.reducer = reducer
        self.environment = environment
    }
    
    func send(_ action: Action) {
        guard let effect = reducer(&state, action, environment) else {
            return
        }
        
        effect
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: send)
            .store(in: &cancellables)
    }
}
