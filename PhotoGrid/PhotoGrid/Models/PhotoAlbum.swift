//
//  PhotoAlbum.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/05.
//

import Foundation

struct PhotoAlbum {
    var cafes: [Cafe]
    
    init(numberOfCafes: Int, numberOfCoffees: Int, makeCafe: (Int) -> Cafe, makeCoffee: (Int) -> Coffee) {
        cafes = [Cafe]()
        for index in 1...numberOfCafes {
            cafes.append(makeCafe(index))
        }
        
        for index in cafes.indices {
            let randomNumber = Int.random(in: 2...numberOfCoffees)
            cafes[index].coffeePhotos = (1...randomNumber).map { index in makeCoffee(index) }
        }
    }
    
    struct Coffee: Identifiable {
        var id = UUID()
        var name: String
    }

    struct Cafe: Identifiable {
        var id = UUID()
        var image: String
        var coffeePhotos: [PhotoAlbum.Coffee] = []
    }
}
