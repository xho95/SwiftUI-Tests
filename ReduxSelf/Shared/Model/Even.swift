//
//  Number.swift
//  ReduxSelf (iOS)
//
//  Created by Kim, Min Ho on 2021/07/18.
//

import Foundation

typealias EvenReducer = Reducer<Even, Even.Action>

struct Even: Statable {
    var isTrue: Bool
    
    let reducer: EvenReducer
    
    init(isTrue: Bool = true,
         reducer: @escaping EvenReducer) {
        self.isTrue = isTrue
        self.reducer = { [self] action in
            var mutatingState = self

            switch action {
            case makeEven:
                mutatingState.is
            case .makeOdd:
                mutatingState.number -= 1
            }
            
            return mutatingState
        }
        }
    }
    enum Action {
        case makeEven
        case makeOdd
    }
}
