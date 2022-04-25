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
    var name: String
    let coordinate: CLLocationCoordinate2D
}

struct ParkingMapView: View {
    @State private var cities = [
        Parklot(name: "parking1", coordinate: .init(latitude: 40.4432, longitude: -79.9428)),
        Parklot(name: "parking2", coordinate: .init(latitude: 40.4448, longitude: -79.9453)),
        Parklot(name: "parking3", coordinate: .init(latitude: 40.4419, longitude: -79.9409)),
        Parklot(name: "parking4", coordinate: .init(latitude: 40.44, longitude: -79.9439)),
        Parklot(name: "parking5", coordinate: .init(latitude: 40.4445, longitude: -79.9429))
        ]

    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @StateObject private var viewModel = MapViewModel()
    
    @State private var feedback = ""
    @State private var rand = Int.random(in: 0..<5)
    @State private var textSwitch = false
    var body: some View {
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true,
            annotationItems: cities) { Parklot in
            MapMarker(coordinate: Parklot.coordinate, tint: Color(.red))
            
            }
        
            .frame(height: 480)
            .accentColor(Color(.systemBlue))
            .onAppear{
                viewModel.checkIfLocationServicesEnabled()}
            .onTapGesture(count: 1, perform: {
                feedback = cities[rand].name})
            
        
        if feedback == "parking2" {
            ZStack{
                VStack(alignment: .leading){
                Text("Parking area 2")
                    .font(.largeTitle)
      
                HStack{
                
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
                }.padding()
               
                
            }
                .overlay(
                        Rectangle()
                            .stroke(Color.green, lineWidth: 2))
                .background(Color.white)
                .padding(.top, 350)
                .frame(height:100)
                .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.textSwitch.toggle()
                                }
                            }
                
        
                        }
        if feedback == "parking1" {
            ZStack{
                VStack(alignment: .leading){
                Text("Parking area 1")
                    .font(.largeTitle)
      
                HStack{
                
                    Image(systemName: "parkingsign")
                        .padding(.trailing)
                        .font(.title)
                        .foregroundColor(.red)
                    Text("6 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
             
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("Currently unavailable")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                }.padding()
               
                
            }
                .overlay(
                        Rectangle()
                            .stroke(Color.green, lineWidth: 2))
                .background(Color.white)
                .padding(.top, 350)
                .frame(height:100)
                .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.textSwitch.toggle()
                                }
                            }
                
        
                        }
        if feedback == "parking3" {
            ZStack{
                VStack(alignment: .leading){
                Text("Parking area 3")
                    .font(.largeTitle)
      
                HStack{
                
                    Image(systemName: "parkingsign")
                        .padding(.trailing)
                        .font(.title)
                        .foregroundColor(.green)
                    Text("5 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
             
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    Text("3 spots available")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                }.padding()
               
                
            }
                .overlay(
                        Rectangle()
                            .stroke(Color.green, lineWidth: 2))
                .background(Color.white)
                .padding(.top, 350)
                .frame(height:100)
                .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.textSwitch.toggle()
                                }
                            }
                
        
                        }
        if feedback == "parking4" {
            ZStack{
                VStack(alignment: .leading){
                Text("Parking area 4")
                    .font(.largeTitle)
      
                HStack{
                
                    Image(systemName: "parkingsign")
                        .padding(.trailing)
                        .font(.title)
                        .foregroundColor(.green)
                    Text("15 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
             
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    Text("20 spots available")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                }.padding()
               
                
            }
                .overlay(
                        Rectangle()
                            .stroke(Color.green, lineWidth: 2))
                .background(Color.white)
                .padding(.top, 350)
                .frame(height:100)
                .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.textSwitch.toggle()
                                }
                            }
                
        
                        }
        if feedback == "parking5" {
            ZStack{
                VStack(alignment: .leading){
                Text("Parking area 5")
                    .font(.largeTitle)
      
                HStack{
                
                    Image(systemName: "parkingsign")
                        .padding(.trailing)
                        .font(.title)
                        .foregroundColor(.red)
                    Text("4 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
             
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("Currently unavailable")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                }.padding()
               
                
            }
                .overlay(
                        Rectangle()
                            .stroke(Color.green, lineWidth: 2))
                .background(Color.white)
                .padding(.top, 350)
                .frame(height:100)
                .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.textSwitch.toggle()
                                }
                            }
                
        
                        }
            }
   
}


struct ParkingMapView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingMapView()
            .previewDevice("iPhone 13 Pro")
    }
}
