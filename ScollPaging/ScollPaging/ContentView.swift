//
//  ContentView.swift
//  ScollPaging
//
//  Created by Min Ho Kim on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HorizontalPageView()
                .tabItem { Label("Horizontal", systemImage: "circle") }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
