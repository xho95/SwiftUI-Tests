//
//  InnerGridView.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/05.
//

import SwiftUI

struct InnerGridView: View {
    var cafe: PhotoAlbum.Cafe
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
            ForEach(cafe.coffeePhotos) { photo in
                Image(photo.name)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .cornerRadius(10)
            }
        }
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        .animation(.easeIn)
    }
}

struct InnerGridView_Previews: PreviewProvider {
    static var previews: some View {
        InnerGridView(cafe: PhotoAlbum.Cafe(image: "cafe-1"))
    }
}
