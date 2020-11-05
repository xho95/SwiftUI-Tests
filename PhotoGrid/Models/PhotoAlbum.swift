//
//  PhotoAlbum.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/05.
//

import Foundation

struct PhotoAlbum {
    var photos: [Photo]
    
    init(numbersOfPhotos: Int, makePhotos: (Int) -> Photo) {
        photos = [Photo]()
        for index in 1...numbersOfPhotos {
            photos.append(makePhotos(index))
        }
    }
    
    struct Photo: Identifiable {
        var id = UUID()
        var name: String
    }

}
