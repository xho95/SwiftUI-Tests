//
//  TrackingView.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/16.
//

import SwiftUI
import CoreLocation

struct TrackingView: View {
    @EnvironmentObject var locationManager: LocationDataManager
    
    var coordinate: CLLocationCoordinate2D? {
        locationManager.location?.coordinate
    }
    
    var body: some View {
        VStack {
            LabeledContent("Latitude:", value: String(coordinate?.latitude ?? 0))
            
            LabeledContent("Longitude", value: String(coordinate?.longitude ?? 0))
            
            LabeledContent("Altitude", value: String(locationManager.location?.altitude ?? 0))
            
            LabeledContent("Speed", value: String(locationManager.location?.speed ?? 0))
            
            LabeledContent("Country", value: locationManager.placemark?.country ?? "")
            
            LabeledContent("City", value: locationManager.placemark?.administrativeArea ?? "")
        }
        .padding()
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
