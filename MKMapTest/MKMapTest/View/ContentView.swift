//
//  ContentView.swift
//  MKMapTest
//
//  Created by Min Ho Kim on 2023/03/12.
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {

    @StateObject var locationViewModel = LocationViewModel()
    var parent = MapView()

    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea()
                .overlay {
                    Button(action: { parent.testFunc() }) {
                        VStack {
//                            Spacer()
                            HStack {
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)

                                    Image(systemName: "map.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.gray)

                                }
                                .padding(.trailing, 10)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
        }
        .onAppear {
            if locationViewModel.authorizationStatus == .notDetermined {
                locationViewModel.requestPermission()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
