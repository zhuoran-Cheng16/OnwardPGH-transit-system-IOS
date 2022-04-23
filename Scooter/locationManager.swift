//
//  locationManager.swift
//  Scooter
//
//  Created by 然 on 4/23/22.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

class locationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
//taken from loren olson's code
    
    let userLocation: CLLocationManager
    @StateObject private var viewModel = MapViewModel()
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.43200654654474, longitude: -111.9426764465573), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    
    
    
    
    var sourceCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 33.43200654654474, longitude: -117.919006)
    var destinationCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 33.812029, longitude: -117.919006)
    
    var sourceMapItem: MKMapItem?
    var destinationMapItem: MKMapItem?
    
    var routePolyline: MKPolyline?
    
    override init()
    {
        userLocation = CLLocationManager()
        
        super.init()
        userLocation.delegate = self
        userLocation.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func start()
    {
        userLocation.startUpdatingLocation()
    }
    

    func getPermission()
    {
        userLocation.requestWhenInUseAuthorization()

    }
    // get user locations
    func getLocation()
    {
        userLocation.requestLocation()
      
    }

    func stop()
    {
        userLocation.stopUpdatingLocation()
    }
    
    
    
    
    // taken from loren olson's code
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.first {
            region.center = newLocation.coordinate
            print(newLocation.coordinate)
        }
        // stop the updates to save battery
        stop()
    }
    
    
    //handle coordinates
    // code from
    
 
    
    // code from: https://medium.com/devtechie/new-in-swiftui-and-ios-15-locationbutton-1737710e26df
    // since this is in a simulator, it's always going to deny the permissions so it's always going to throw the error "The operation couldn’t be completed. (kCLErrorDomain error 1.)
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

   
   // just use this one we have locationA and locationB
    

    
    
}
