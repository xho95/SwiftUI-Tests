//
//  Generator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

protocol Generator {
    var name: String { get }    //  Wrapped Value
    
    var namePublished: Published<String> { get }                // Property Wrapper?
    var namePublisher: Published<String>.Publisher { get }      // Publisher
    
    func generate()
}
