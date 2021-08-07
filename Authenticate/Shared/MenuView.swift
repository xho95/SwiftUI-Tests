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
        GameCenterManager()
/*
        NavigationView {
            NavigationLink(
                destination: ContentView(),
                label: { Text("Show Content") }
            )
        }
        .navigationBarItems(
            leading: GameCenterManager() //.ignoresSafeArea(edges: .top)
        )
 */
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
