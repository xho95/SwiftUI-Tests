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

                    Button(action: {
                        parent.testFunc()
                    }) {
                        VStack {
                            Spacer()
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

        func mapView(_ mapView: MKMapView,
                     didUpdate userLocation: MKUserLocation) {
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
    }

    func testFunc()  {
        print("Toggle Compass")
    }
}

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

    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
