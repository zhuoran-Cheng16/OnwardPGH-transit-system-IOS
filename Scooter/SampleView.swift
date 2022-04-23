////
////  SampleView.swift
////  Scooter
////
////  Created by 然 on 4/23/22.
////
//
//import SwiftUI
//import MapKit
//
//struct SampleView: View {
//    @State var route: MKPolyline?
//    @StateObject private var viewModel = MapViewModel()
//    var body: some View {
//        MapView(route: $viewModel.region)
//            .onAppear {
//                self.findCoffee()
//        }
//    }
//}
//
//struct SampleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SampleView()
//    }
//}
//
//
//private extension SampleView {
//    func findCoffee() {
//        let start = CLLocationCoordinate2D(latitude: 37.332693, longitude: -122.03071)
//        let region = MKCoordinateRegion(center: start, latitudinalMeters: 2000, longitudinalMeters: 2000)
//
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = "coffee"
//        request.region = region
//
//        MKLocalSearch(request: request).start { response, error in
//            guard let destination = response?.mapItems.first else { return }
//
//            let request = MKDirections.Request()
//            request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
//            request.destination = destination
//            MKDirections(request: request).calculate { directionsResponse, _ in
//                self.route = directionsResponse?.routes.first?.polyline
//            }
//        }
//    }
//}
