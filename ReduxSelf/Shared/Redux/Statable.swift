//
//  Statable.swift
//  ReduxSelf (iOS)
//
//  Created by Kim, Min Ho on 2021/07/18.
//

import Foundation

typealias Reducer<State, Action> = (Action) -> State

protocol Statable {
    associatedtype Action
    
    var reducer: Reducer<Self, Action> { get }
}
