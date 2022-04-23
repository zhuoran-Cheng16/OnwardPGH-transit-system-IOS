//
//  MapView.swift
//  Landmarks
//
//  Created by 然 on 2022/3/18.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow


    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .accentColor(Color(.systemBlue))
            .onAppear{
                viewModel.checkIfLocationServicesEnabled()
            }
    }
           
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 13 Pro")
    }
}
