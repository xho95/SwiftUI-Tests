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
                .tabItem { Label("Horizontal", systemImage: "arrow.left.and.right.square") }
                .tag(0)
            
            ScrollPageView()
                .tabItem { Label("Scroll", systemImage: "rectangle.portrait.arrowtriangle.2.outward") }
                .tag(1)
            
            GesturePageView()
                .tabItem { Label("Gesture", systemImage: "person.and.arrow.left.and.arrow.right") }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
