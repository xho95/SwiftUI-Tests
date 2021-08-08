//
//  MenuView.swift
//  Authenticate
//
//  Created by Kim, Min Ho on 2021/08/05.
//

import SwiftUI
import GameKit

struct MenuView: View {
    let localPlayer = GKLocalPlayer.local
    
    var body: some View {
        NavigationView {
            ZStack {
                //GameCenterManager()
                
                NavigationLink(
                    destination: ContentView(),
                    label: { Text("Show Content") }
                )
                .ignoresSafeArea()
            }
            .navigationBarItems(
                leading: Button {
                    GKAccessPoint.shared.trigger(state: .dashboard) {}
                } label: {
                    //Image(systemName: "")
                    Text("Game Center")
                }
            )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
