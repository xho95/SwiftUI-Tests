//
//  GithubService.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation
import Combine

struct World {
    var service = GithubService()
}

class GithubService {
    private let session: URLSession
    private let decoder: JSONDecoder

    // typealias SendRequest = (URLRequest) -> AnyPublisher<Data, URLSessionError>
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func searchPublisher(matching query: String) -> AnyPublisher<[Repo], Error> {
        guard var urlComponents = URLComponents(string: "https://api.github.com/search/repositories") else {
            preconditionFailure("Can't create url components...")
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        
        guard let url = urlComponents.url else {
            preconditionFailure("Can't create url from url components...")
        }
        
        return session
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: decoder)
            .map { $0.items }
            .eraseToAnyPublisher()
        
        /*
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return sendRequest(request)
            .decode(type: ItemResponse<Repository>.self, decoder: decoder)
            .map { Result<[Repository], ErrorResponse>.success($0.items) }
            .catch { error -> SearchResponse in
                guard case let .serverErrorMessage(_, data)? = error as? URLSessionError else {
                    return .just(.success([]))
                }
                do {
                    let response = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    return .just(.failure(response))
                } catch _ {
                    return .just(.success([]))
                }
            }
            .eraseToAnyPublisher()
         */
    }
}
