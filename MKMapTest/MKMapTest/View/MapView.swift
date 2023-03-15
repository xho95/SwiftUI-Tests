//
//  MapView.swift
//  MKMapTest
//
//  Created by Min Ho Kim on 2023/03/12.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            //print(mapView.centerCoordinate)
        }

        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            print("User location\(userLocation.coordinate)")
        }

        func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
            print("Map will start loading")
        }

        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            print("Map did finish loading")
        }

        func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
            print("Map will start locating user")
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }

    func makeUIView(context: Context) -> MKMapView {
        let region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.8136, longitude: 144.9631), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = region

        mapView.showsScale = true
        mapView.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: true)
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading

        mapView.showsUserLocation = true
        //mapView.showsCompass = false

        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
//        view.centerCoordinate.longitude
    }

    func testFunc()  {
        print("Toggle Compass")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
