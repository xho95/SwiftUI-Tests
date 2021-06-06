//
//  Reducer.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation
import Combine

typealias Reducer<State, Action, Environment> =
    (inout State, Action, Environment) -> AnyPublisher<Action, Never>?

func appReducer(state: inout AppState,
                action: AppAction,
                environment: World) -> AnyPublisher<AppAction, Never>?  {
    switch action {
    case let .setSearchResult(repos):
        state.searchResult = repos
    case let .search(query):
        return environment.service
            .searchPublisher(matching: query)
            .replaceError(with: [])
            .map { AppAction.setSearchResult(repos: $0) }
            .eraseToAnyPublisher()
    }
    
    return Empty().eraseToAnyPublisher()
}
