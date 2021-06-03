//
//  State.swift
//  ReduxCombine
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

struct State {
    var users: [String]
    var posts: [String]
    
    static func `default`() -> State {
        return .init(users: [], posts: [])
    }
}
