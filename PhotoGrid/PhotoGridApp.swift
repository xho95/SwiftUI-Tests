//
//  PhotoGridApp.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/05.
//

import SwiftUI

@main
struct PhotoGridApp: App {
    var body: some Scene {
        let photoLibrary = PhotoLibrary()
        
        WindowGroup {
            ContentView(viewModel: photoLibrary)
        }
    }
}
