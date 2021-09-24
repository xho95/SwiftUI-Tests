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
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.yellow)
                        Image(systemName: "list.number")
                            .font(.system(size: 25, weight: .medium, design: .default))
                    }
                    .offset(x: 0, y: -25)
                    .shadow(radius: 5)
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
