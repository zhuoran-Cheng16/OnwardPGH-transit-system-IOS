//
//  ScooterMapView.swift
//  Scooter
//
//  Created by xinyue xie on 2022/4/24.
//

import MapKit
import SwiftUI
import UIKit
import Contacts

struct ScooterMapView: View {
    @State private var directions: [String] = []
    @State private var showDirections = false

    
    var body: some View {
      VStack {
          ScooterMapViewDirection(directions: $directions)

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


struct ScooterMapViewDirection: UIViewRepresentable {

    typealias UIViewType = MKMapView
    @StateObject private var viewModel = MapViewModel()
    @Binding var directions: [String]

    func makeCoordinator() -> MapViewCoordinator {
      return MapViewCoordinator()
    }

    
      func makeUIView(context: Context) -> MKMapView {
      let mapView = MKMapView()
      mapView.delegate = context.coordinator
          mapView.isRotateEnabled=false
      mapView.showsUserLocation=true

          class CustomAnnotationView: MKMarkerAnnotationView {
              override var annotation: MKAnnotation? {
                  willSet {
                      canShowCallout = true
                      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                      titleVisibility = .hidden
                      subtitleVisibility = .hidden
                      displayPriority = .required
                  }
              }
          }

          mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

      let region = viewModel.region
      mapView.setRegion(region, animated: true)

      //user location
        let p1 = MKPlacemark(coordinate: region.center)

      // destination
      let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.4512428846061, longitude: -79.95088134077386))
        
        // annotation
        let annotationView1 = MKPointAnnotation()
        annotationView1.coordinate = CLLocationCoordinate2D(latitude:40.4512428846061, longitude: -79.95088134077386)
        annotationView1.title = "Route 1"
        annotationView1.subtitle = "Scooter: 12 min"
        mapView.addAnnotation(annotationView1)
    
        let annotationView2 = MKPointAnnotation()
          annotationView2.coordinate = CLLocationCoordinate2D(latitude:40.4512428846061, longitude: -79.95088134077386)
          annotationView2.title = "Route 1"
          annotationView2.subtitle = "WheelChair: 8 min"
          mapView.addAnnotation(annotationView2)
          
        let request = MKDirections.Request()
          let request2=MKDirections.Request()
          
      request.source = MKMapItem(placemark: p1)
      request.destination = MKMapItem(placemark: p2)
      request.transportType = .automobile
          request2.source = MKMapItem(placemark: p1)
          request2.destination = MKMapItem(placemark: p2)
          request2.transportType = .walking

      let directions = MKDirections(request: request)
          let directions2 = MKDirections(request: request2)
      directions.calculate { response, error in
        guard let route = response?.routes.first else { return }
        mapView.addAnnotations([p1])
        
        mapView.addOverlay(route.polyline)
        mapView.setVisibleMapRect(
          route.polyline.boundingMapRect,
          edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
          animated: true)
        self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
      }
        directions2.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotations([p1])
            
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




struct ScooterMapView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterMapView().previewDevice("iPhone 13 Pro")
    }
}
