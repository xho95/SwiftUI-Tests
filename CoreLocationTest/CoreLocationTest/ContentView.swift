//
//  ContentView.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var location: LocationDataManager

//    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some View {
        VStack {
            switch location.authorizationStatus {
//                switch location.locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                Text("Your current location is:")
                Text("Latitude: \(location.coordinate?.latitude.description ?? "Error loading")")
                Text("Longitude: \(location.coordinate?.longitude.description ?? "Error loading")")
            case .restricted, .denied:
                Text("Current location data was restricted or denied.")
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
