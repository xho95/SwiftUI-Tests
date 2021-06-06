//
//  RepoRow.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import SwiftUI

struct RepoRow: View {
    let repo: Repo
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(repo.name)
                    .font(.headline)
                Text(repo.description ?? "")
                    .font(.subheadline)
            }
        }
    }
}

/*
struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow()
    }
}
*/
