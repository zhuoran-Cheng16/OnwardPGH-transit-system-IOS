////
////  MapView.swift
////  Landmarks
////
////  Created by 然 on 2022/3/18.
////
//
//import SwiftUI
//import MapKit
//
//struct OriginalMapView: UIViewRepresentable {
//    @EnvironmentObject var userLocation: locationManager
//    @StateObject private var viewModel = MapViewModel()
//    @State private var userTrackingMode: MapUserTrackingMode = .follow
//    
//    typealias UIViewType = MKMapView
//    
//    func makeUIView(context: Context) -> MKMapView {
//        return MKMapView()
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        uiView.showsUserLocation = true
//        uiView.showsScale = true
//        uiView.showsBuildings = false
//        uiView.showsTraffic = true
//        uiView.setRegion(viewModel.region, animated: true)
//        
//    }
//}
//
//struct OriginalMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        OriginalMapView()
//            .previewDevice("iPhone 13 Pro")
//    }
//}
