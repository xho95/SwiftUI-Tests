//
//  ContentView.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import SwiftUI

struct SearchContainerView: View {
    @EnvironmentObject var store: AppStore
    @State private var query: String = "Swift"
    
    var body: some View {
        SearchView(
            query: $query,
            repos: store.state.searchResult,
            onCommit: fetch
        )
        .onAppear(perform: fetch)
    }
    
    private func fetch() {
        store.send(.search(query: query))
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContainerView()
    }
}
*/
