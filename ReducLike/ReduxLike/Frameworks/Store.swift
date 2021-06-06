//
//  Store.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

typealias AppStore = Store<State, Action>

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private var reducer: Reducer<State, Action>
    
    init(state: State, reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
    }
}
