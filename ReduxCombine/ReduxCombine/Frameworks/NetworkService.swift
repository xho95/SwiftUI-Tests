//
//  NetworkService.swift
//  ReduxCombine
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation
import Combine

class NetworkService {
    private let usersURL = URL(string: "http://www.mocky.io/v2/5e58f1832f000020979622b7")!
    private let postsURL = URL(string: "http://www.mocky.io/v2/5e59dd6830000054001f0a56")!
    
    func getUsers() -> AnyPublisher<Action, Never> {
        URLSession.shared
            .dataTaskPublisher(for: usersURL)
            .map { $0.data }
            .decode(type: Users.self, decoder: JSONDecoder())
            .replaceError(with: .init(data: [""]))
            .map { users -> Action in .setUsers(users.data) }
            .eraseToAnyPublisher()
    }
    
    func getPosts() -> AnyPublisher<Action, Never> {
        URLSession.shared
            .dataTaskPublisher(for: postsURL)
            .map { $0.data }
            .decode(type: Posts.self, decoder: JSONDecoder())
            .replaceError(with: .init(data: [""]))
            .map { posts -> Action in .setPosts(posts.data) }
            .eraseToAnyPublisher()
    }
}
