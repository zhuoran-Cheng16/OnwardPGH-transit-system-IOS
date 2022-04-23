//
//  MapView.swift
//  Landmarks
//
//  Created by 然 on 2022/3/18.
//

import SwiftUI
import MapKit

struct Parklot: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ParkingMapView: View {
    @State private var cities: [Parklot] = [
            Parklot(coordinate: .init(latitude: 40.4432, longitude: -79.9428)),
            Parklot(coordinate: .init(latitude: 40.447540, longitude: -79.943510))
        ]

    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @StateObject private var viewModel = MapViewModel()
    
    @State private var feedback = ""

    var body: some View {
        
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true,
            annotationItems: cities) { Parklot in
            MapMarker(coordinate: Parklot.coordinate, tint: Color(.systemBlue))
            }
        
            .ignoresSafeArea()
            .accentColor(Color(.systemBlue))
            .onAppear{
                viewModel.checkIfLocationServicesEnabled()}
            .onTapGesture(count: 1, perform: {
                feedback="work"})
            
        
        if feedback != "" {
            VStack(alignment: .leading){
                Text("Parking area 2")
                    .font(.largeTitle)
                HStack{
                    Spacer()
                    Image(systemName: "parkingsign")
                        .padding(.trailing)
                        .font(.title)
                        .foregroundColor(.green)
                    Text("8 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    Text("Little further but 25 spots available")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Divider()
                
            }.padding()
        }
            }
   
}


struct ParkingMapView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingMapView()
            .previewDevice("iPhone 13 Pro")
    }
}
