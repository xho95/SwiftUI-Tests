//
//  AppState.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

struct AppState {
    var searchResult: [Repo] = []
}

struct SearchResponse: Decodable {
    let items: [Repo]
}
