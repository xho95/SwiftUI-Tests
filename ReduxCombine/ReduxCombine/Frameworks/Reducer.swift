//
//  Reducer.swift
//  ReduxCombine
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

func reducer(state: inout State, action: Action) -> State {
    switch action {
    case .setUsers(let users):
        state.users = users
    case .setPosts(let posts):
        state.posts = posts
    }
    
    return state
}
