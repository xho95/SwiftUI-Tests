//
//  SearchView.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import SwiftUI

struct SearchView: View {
    @Binding var query: String
    
    let repos: [Repo]
    let onCommit: () -> Void
    
    var body: some View {
        NavigationView {
            List {
                TextField("Type something", text: $query, onCommit: onCommit)
                
                if repos.isEmpty {
                    Text("Loading...")
                } else {
                    ForEach(repos) { repo in
                        //
                    }
                }
            }
            .navigationTitle(Text("Search"))
        }
    }
}

/*
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
*/
