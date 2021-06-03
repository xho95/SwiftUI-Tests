//
//  Store.swift
//  Redux
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

typealias Reducer = (State, Action) -> State

class Store: ObservableObject {
    @Published var state: State
    
    var reducer: Reducer
    
    init(state: State = State(), reducer: @escaping Reducer) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        self.state = reducer(state, action)
        
        print(self.state)
    }
    
}
