//
//  AppAction.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

enum AppAction {
    case search(query: String)
    case setSearchResult(repos: [Repo])
}
