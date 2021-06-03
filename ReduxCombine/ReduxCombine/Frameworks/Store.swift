//
//  Store.swift
//  ReduxCombine
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation
import Combine

class Store {
    private(set) var state: State
    private let networkService: NetworkService
    private var cancellables: Set<AnyCancellable> = []
    
    init(state: State = .default(), networkService: NetworkService = .init()) {
        self.state = state
        self.networkService = networkService
    }
    
    public func dispatch(action: Action) {
        state = reducer(state: &state, action: action)
    }
    
    public func dispatch(action: AsyncAction) {
        func mapToAction(_ action: AsyncAction) -> AnyPublisher<Action, Never> {
            switch action {
            case .getUsers:
                return networkService.getUsers()
            case .getPosts:
                return networkService.getPosts()
            }
        }
        
        mapToAction(action)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: dispatch)
            .store(in: &cancellables)
    }
}
