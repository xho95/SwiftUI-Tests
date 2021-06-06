//
//  Repo.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

struct Repo: Decodable, Identifiable {
    var id: Int
    let owner: Owner
    let name: String
    let description: String?
    
    struct Owner: Decodable {
        let avatar: URL
        
        enum CodingKeys: String, CodingKey {
            case avatar = "avatar_url"
        }
    }
}

