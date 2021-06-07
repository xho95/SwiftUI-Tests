//
//  LogMiddleware.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation
import Combine

func logMiddleware() -> Middleware<State, Action> {
    { state, action in
        print("Triggered action: \(action)")
        
        return Empty().eraseToAnyPublisher()
    }
}
