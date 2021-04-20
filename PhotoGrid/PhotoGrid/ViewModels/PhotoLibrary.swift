//
//  PhotoLibrary.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/05.
//

import SwiftUI

class PhotoLibrary: ObservableObject {
    @Published private var model = makePhotos()
    
    /// makes and returns an array of photos using a sequence of numbers
    /// - Returns: 20 photos about coffee
    static func makePhotos() -> PhotoAlbum {
        PhotoAlbum(numberOfCafes: 18, numberOfCoffees: 20) { index in
            PhotoAlbum.Cafe(image: "cafe-\(index)")
        } makeCoffee: { index in
            PhotoAlbum.Coffee(name: "coffee-\(index)")
        }
    }
    
    var cafes: [PhotoAlbum.Cafe] {
        model.cafes
    }
}
