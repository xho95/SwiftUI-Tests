//
//  AppStateMiddleware.swift
//  ReduxSelf (iOS)
//
//  Created by Kim, Min Ho on 2021/07/19.
//

import Foundation
import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

let appStateMiddleware: Middleware<AppState, AppState.Action> = { state, action in
    switch action {
    default:
        break
    }
    return Empty().eraseToAnyPublisher()
}
