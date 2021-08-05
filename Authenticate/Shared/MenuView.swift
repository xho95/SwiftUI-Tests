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
            NavigationLink(
                destination: ContentView(),
                label: { Text("Show Content") }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            authenticateUser()
        }
    }
    
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
