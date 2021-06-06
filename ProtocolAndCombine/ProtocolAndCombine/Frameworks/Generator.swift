//
//  Generator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

protocol Generator {
    @Published var name: String { get }
    
    func genenrate()
}
