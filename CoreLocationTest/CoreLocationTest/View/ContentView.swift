//
//  ContentView.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationDataManager
    
    var body: some View {
        VStack {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                RequestLocationView()
            case .restricted:
                LocationErrorView(errorMessage: "Location use is restricted.")
            case .denied:
                LocationErrorView(errorMessage: "The app does not have location permissions. Please enable them in settings.")
            case .authorizedWhenInUse, .authorizedAlways:
                TrackingView()
//                Text("Your current location is:")
//                Text("Latitude: \(location.coordinate?.latitude.description ?? "Error loading")")
//                Text("Longitude: \(location.coordinate?.longitude.description ?? "Error loading")")
            default:
                Text("Unexpected Status.")
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
