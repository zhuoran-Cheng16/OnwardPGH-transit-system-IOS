//
//  MapViewModel.swift
//  Scooter
//
//  Created by 然 on 4/22/22.
//

import CoreLocation
import MapKit

enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 40.4432, longitude: -79.9428)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
}
//www.youtube.com/watch?v=hWMkimzIQoU
final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span:MapDetails.defaultSpan
    )
    var locationManager: CLLocationManager?
    func checkIfLocationServicesEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }else{
            print("cannot get the permission to get your current location")
        }
    }
    
     func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restriceted due to parental controls")
            case .denied:
                print("You had deny the location permission")
            case .authorizedAlways,.authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)

            @unknown default:
                break
        }
    }
    //recheck the user location when moving
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
