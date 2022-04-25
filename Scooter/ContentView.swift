//
//  ContentView.swift
//  Landmarks
//
//  Created by xinyue xie on 2022/3/19.
//

import CoreLocation
import MapKit
import SwiftUI
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
    NavigationView {
      VStack(spacing: 0) {
        VStack(alignment: .leading, spacing: 0) {
          HStack {
            Image(systemName: "circle")
              .foregroundColor(.blue)
            TextField("Current Location", text: $location)
          }
          HStack {
            Image(systemName: "mappin.and.ellipse")
              .foregroundColor(.red)
            TextField("Destination", text: $destination)
          }

        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .ignoresSafeArea(.all, edges: .bottom)
        .padding()

        Divider()
          
        ZStack {

          ScooterMapView()
                .frame(height: 480)
                .padding()
        Button(action: {
            TripTracker.singleton.startTrip()
        }) {
            HStack {
                Image (systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                Text("Start Trip")
                    .font(.subheadline)
                    .foregroundColor(.white)}
        }
              .buttonStyle(ParkButton())
              .padding(.top, 380)
        }
        

        VStack(alignment: .leading) {

                
          NavigationLink(

            destination: FeedbackView(showDetail: $showDetail), isActive: self.$showDetail
          ) { EmptyView() }
          Button(action: {
            self.displayPopupMessage = true
            TripTracker.singleton.endTrip()
          }) {
              HStack {
                  Image (systemName: "checkmark.circle.fill")
                      .foregroundColor(.white)
                  Text("Trip Completed")
                      .font(.subheadline)
                      .foregroundColor(.white)}
          }
                .buttonStyle(ParkButton())
          .alert(isPresented: $displayPopupMessage) {
            Alert(
              title: Text("Submit Feedback"),
              message: Text("Please submit your feedback on the next page."),
              dismissButton:
                .default(Text("OK"), action: { self.showDetail = true })
            )
          }
            
        }

      }.padding(.top,-40)
        
        Divider()
    }
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {

    ContentView()
      .previewDevice("iPhone 13 Pro")

  }
}
