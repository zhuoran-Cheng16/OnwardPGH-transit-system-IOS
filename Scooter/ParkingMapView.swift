//
//  MapView.swift
//  Landmarks
//
//  Created by 然 on 2022/3/18.
//

import MapKit
import SwiftUI

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
    Parklot(name: "parking5", coordinate: .init(latitude: 40.4445, longitude: -79.9429)),
  ]

  @State private var userTrackingMode: MapUserTrackingMode = .follow
  @StateObject private var viewModel = MapViewModel()
  @State private var feedback = ""
  @State private var rand = Int.random(in: 0..<5)
  @State private var textSwitch = false
  var body: some View {
    Map(
      coordinateRegion: $viewModel.region,
      showsUserLocation: true,
      annotationItems: cities
    ) { Parklot in
      MapMarker(coordinate: Parklot.coordinate, tint: Color(.red))
    }
    .frame(height: 480)
    .accentColor(Color(.systemBlue))
    .onAppear {
      viewModel.checkIfLocationServicesEnabled()
    }
    .onTapGesture(
      count: 1,
      perform: {
        feedback = cities[rand].name
      })

    if feedback == "parking2" {
      ZStack {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "fuelpump.fill")
            Text("Parking area 2")
              .font(.title3)
            Text("$ 4/h")
              .foregroundColor(.gray)
              .padding(.leading, 30.0)
          }
          HStack {
            Text("Forbes Street   0.2km")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.top, -5)
          }
          HStack {
            Text("Open Now")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("No parking 9am-4pm")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
          HStack {
            Text("Avaliable Spots")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("Except Sunday")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
        }.padding()
      }
      .overlay(
        Rectangle()
          .stroke(Color.green, lineWidth: 2)
      )
      .background(Color.white)
      .padding(.top, 350)
      .frame(height: 100)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          self.textSwitch.toggle()
        }
      }
    }
    if feedback == "parking1" {
      ZStack {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "fuelpump.fill")
            Text("Parking area 1")
              .font(.title3)
            Text("$ 4/h")
              .foregroundColor(.gray)
              .padding(.leading, 30.0)

          }
          HStack {
            Text("Forbes Street   0.2km")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.top, -5)
          }
          HStack {
            Text("Open Now")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("No parking 9am-4pm")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
          HStack {
            Text("Avaliable Spots")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("Except Sunday")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
        }.padding()
      }
      .overlay(
        Rectangle()
          .stroke(Color.green, lineWidth: 2)
      )
      .background(Color.white)
      .padding(.top, 350)
      .frame(height: 100)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          self.textSwitch.toggle()
        }
      }

    }
    if feedback == "parking3" {
      ZStack {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "fuelpump.fill")
            Text("Parking area 3")
              .font(.title3)

            Text("$ 4/h")
              .foregroundColor(.gray)
              .padding(.leading, 30.0)

          }
          HStack {
            Text("Forbes Street   0.2km")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.top, -5)
          }

          HStack {

            Text("Open Now")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("No parking 9am-4pm")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
          HStack {
            Text("Avaliable Spots")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("Except Sunday")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
        }.padding()
      }
      .overlay(
        Rectangle()
          .stroke(Color.green, lineWidth: 2)
      )
      .background(Color.white)
      .padding(.top, 350)
      .frame(height: 100)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          self.textSwitch.toggle()
        }
      }
    }
    if feedback == "parking4" {
      ZStack {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "fuelpump.fill")
            Text("Parking area 4")
              .font(.title3)

            Text("$ 4/h")
              .foregroundColor(.gray)
              .padding(.leading, 30.0)
          }
          HStack {
            Text("Forbes Street   0.2km")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.top, -5)
          }
          HStack {
            Text("Open Now")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("No parking 9am-4pm")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
          HStack {
            Text("Avaliable Spots")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("Except Sunday")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
        }.padding()
      }
      .overlay(
        Rectangle()
          .stroke(Color.green, lineWidth: 2)
      )
      .background(Color.white)
      .padding(.top, 350)
      .frame(height: 100)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          self.textSwitch.toggle()
        }
      }
    }
    if feedback == "parking5" {
      ZStack {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "fuelpump.fill")
            Text("Parking area 5")
              .font(.title3)

            Text("$ 4/h")
              .foregroundColor(.gray)
              .padding(.leading, 30.0)
          }
          HStack {
            Text("Forbes Street   0.2km")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.top, -5)
          }
          HStack {
            Text("Open Now")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("No parking 9am-4pm")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
          HStack {
            Text("Avaliable Spots")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("Except Sunday")
              .font(.footnote)
              .foregroundColor(.gray)
              .padding(.leading)
          }
        }.padding()
      }
      .overlay(
        Rectangle()
          .stroke(Color.green, lineWidth: 2)
      )
      .background(Color.white)
      .padding(.top, 350)
      .frame(height: 100)
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
