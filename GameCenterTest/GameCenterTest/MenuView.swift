//
//  MenuView.swift
//  GameCenterTest
//
//  Created by Kim, Min Ho on 2021/08/06.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                GameCenterManager()

                NavigationLink(
                    destination: ContentView(),
                    label: { Text("Show Content") }
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
