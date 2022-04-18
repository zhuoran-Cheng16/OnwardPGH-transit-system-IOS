//
//  MapView.swift
//  Landmarks
//
//  Created by 然 on 2022/3/18.
//

import SwiftUI
import MapKit


struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var cities: [City] = [
            City(coordinate: .init(latitude: 40.4432, longitude: -79.9428)),
            City(coordinate: .init(latitude: 40.447540, longitude: -79.943510))
        ]
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.4432, longitude: -79.9428),
        span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
    )

    var body: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: true,
            annotationItems: cities) { city in
            MapPin(coordinate: city.coordinate, tint: .red)
                }
            .accentColor(Color(.systemPink))
            
            }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 13 Pro")
    }
}
