//
//  ContentView.swift
//  Directions
//

import MapKit
import SwiftUI
import UIKit

struct MapView: View {
    
    @State private var directions: [String] = []
    @State private var showDirections = false
    
    var body: some View {
        VStack {
            MapViewDirection(directions: $directions)
            
        }.sheet(isPresented: $showDirections, content: {
            VStack(spacing: 0) {
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color(UIColor.systemBlue))
                
                List(0..<self.directions.count, id: \.self) { i in
                    Text(self.directions[i]).padding()
                }
            }
        })
    }
}

struct MapViewDirection: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    @StateObject private var viewModel = MapViewModel()
    @Binding var directions: [String]
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation=true
        
        let region = viewModel.region
        mapView.setRegion(region, animated: true)
        
        //user location
        let source_co = MKPointAnnotation()
        
        //just add the tag shown in this map
        source_co.title="Hunt Library"
        source_co.subtitle = "4909 Frew St, Pittsburgh, PA, 15213"
        //related to the mapviewModel
        source_co.coordinate=region.center
        let p1 = MKPlacemark(coordinate: source_co.coordinate)
        
        // destination
        let des_co = MKPointAnnotation()
        des_co.title="Home"
        des_co.subtitle = "230 N Craig St, Pittsburgh, PA, 15213"
        des_co.coordinate=CLLocationCoordinate2D(latitude: 40.4512428846061, longitude: -79.95088134077386)
        
        let p2 = MKPlacemark(coordinate: des_co.coordinate)
        
        let request = MKDirections.Request()
        
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotation(source_co)
            mapView.addAnnotation(des_co)
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
