//
//  PhotoMainView.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/07.
//

import SwiftUI

struct PhotoMainView: View {    
    @ObservedObject var viewModel: PhotoLibrary

    var body: some View {
        NavigationView {
            ScrollView {
                PhotoGridView(viewModel: viewModel)
            }
        }
    }
}

struct PhotoMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoMainView(viewModel: PhotoLibrary())
    }
}
