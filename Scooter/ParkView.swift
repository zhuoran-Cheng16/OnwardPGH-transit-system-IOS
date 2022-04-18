//
//  ParkView.swift
//  Scooter
//
//  Created by Zitan Chen on 3/21/22.
//

import SwiftUI

struct ParkView: View {
    @State private var isDisplayed = true
    @State var location: String = ""
    @State var destination: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack{
                        Image (systemName: "circle")
                            .foregroundColor(.gray)
                        TextField("Current Location", text: $location)}
                    HStack{
                        Image (systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                        TextField("Destination", text: $destination)
                    }
                }
                MapView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 189)
                VStack(alignment: .leading) {
                    HStack {
                        Image (systemName: "parkingsign")
                            .foregroundColor(.blue)
                        Text("Parking Slot")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Divider()
                    Text("Parking area 1")
                        .font(.largeTitle)
                    HStack {
                        Spacer()
                        Image(systemName: "parkingsign")
                            .padding(.trailing)
                            .font(.title)
                            .foregroundColor(.red)
                        Text("3 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image (systemName: "exclamationmark.circle")
                            .foregroundColor(.red)
                        Text("Closer but only 2 spots available")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    Divider()
                }.padding()
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
                .navigationBarTitle("User Input")
            
            }
    }
}
struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        
        ParkView()
            .previewDevice("iPhone 13 Pro")

    }
}
