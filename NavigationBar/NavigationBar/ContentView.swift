//
//  ContentView.swift
//  NavigationBar
//
//  Created by Kim, Min Ho on 2021/12/15.
//

import SwiftUI

struct ContentView: View {
    @State private var fullScreen = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
//
//        let attributes: [NSAttributedString.Key: Any] = [
//            .foregroundColor: UIColor.white,
//            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .black)
//        ]
//
//        appearance.largeTitleTextAttributes = attributes
//
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            Button("Toggle Full Screen") {
                self.fullScreen.toggle()
            }
            .navigationTitle("Full Screen")
            .navigationBarTitleDisplayMode(fullScreen ? .inline : .large)
//            .navigationBarHidden(fullScreen)
            .navigationBarItems(
                leading: Button {
                    //
                } label: {
                    Text("Button")
                },
                trailing: Button {
                    print("hi")
                } label: {
                    Image(systemName: "star.circle")
                        .font(.system(size: 25))
                        .accentColor(.white)
                        .padding()
                        .frame(width: 25 * 2, height: 25 * 2)
                        .cornerRadius(25)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 0.5)
                                .frame(width: 25 * 2, height: 25 * 2)
                        )
                        .offset(x: 0, y: 25)
//                        .offset(x: 0, y: -15)
                        .shadow(radius: 5)
                }
            )
        }
        .statusBar(hidden: true)
        //        .statusBar(hidden: fullScreen)
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
