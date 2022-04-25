//
//  ContentView.swift
//  Landmarks
//
//  Created by xinyue xie on 2022/3/19.
//

import SwiftUI
import CoreLocation
import MapKit
import UIKit

struct TripButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            
    }
}

struct ContentView: View {
    @State private var isDisplayed = true
    @State var location: String = ""
    @State var destination: String = ""
    @State private var showDetail = false
    @State private var directions: [String] = []
    @State private var showDirections = false
    @State private var displayPopupMessage: Bool = false

    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Image (systemName: "circle")
                            .foregroundColor(.blue)
                        TextField("Current Location", text: $location)}
                   HStack{
                        Image (systemName: "mappin.and.ellipse")
                           .foregroundColor(.red)
                        TextField("Destination", text: $destination)}
                                
                  }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .ignoresSafeArea(.all, edges: .bottom)
                            .padding()
                
            Divider()
            ZStack {
                ScooterMapView();
           
            }
                  .frame(height:480)
                  .padding()
            
            
            VStack(alignment: .leading) {
                NavigationLink(destination: StartParkView(showDetail: $showDetail), isActive: self.$showDetail) { EmptyView() }
                        Button(action: {
                            self.displayPopupMessage = true
                        }) {Text("Start Trip")}
            
                        .buttonStyle(TripButton())
            }
            }.padding(.top,-40)

}

}



struct ContentView_Previews: PreviewProvider {
static var previews: some View {

ContentView()
.previewDevice("iPhone 13 Pro")

}
}

