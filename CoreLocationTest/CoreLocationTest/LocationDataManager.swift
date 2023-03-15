//
//  LocationDataManager.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/15.
//

import Foundation
import CoreLocation

// requestLocation: get a single, one time location data point
// https://coledennis.medium.com/tutorial-connecting-core-location-to-a-swiftui-app-dc62563bd1de

class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            // Location services are available.
            // Insert code here of what should happen when Location services are authorized.
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation()
            break
        case .restricted:
            // Location services currently unavailable.
            // Insert code here of what should happen when Location services are Not authorized.
            authorizationStatus = .restricted
            break
        case .denied:
            // Location services currently unavailable.
            // Insert code here of what should happen when Location services are Not authorized.
            authorizationStatus = .denied
            break
        case .notDetermined:
            // Authorization not determined yet.
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Insert code to handle location updates
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Insert code to handle not to able to retrieve location data
        print("error: \(error.localizedDescription)")
    }
}


// startUpdatingLocation: the most precise and regular location data
// https://www.andyibanez.com/posts/using-corelocation-with-swiftui/

/*
class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
}
*/
