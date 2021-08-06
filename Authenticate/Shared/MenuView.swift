//
//  MenuView.swift
//  Authenticate
//
//  Created by Kim, Min Ho on 2021/08/05.
//

import SwiftUI
import GameKit

struct MenuView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ContentView(),
                label: { Text("Show Content") }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
