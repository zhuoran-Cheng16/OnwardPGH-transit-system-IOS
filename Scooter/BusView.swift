//
//  BusView.swift
//  Landmarks
//
//  Created by xinyue xie on 2022/3/19.
//

import SwiftUI

struct BusView: View {
    @State private var isDisplayed = true
    @State var location: String = ""
    @State var destination: String = ""
    @State private var showDetail = false
    @StateObject private var viewModel = MapViewModel()
    @EnvironmentObject var userLocation: locationManager
    @State private var directions: [String] = []
    @State private var showDirections = false
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Image (systemName: "circle")
                                .foregroundColor(.blue)
                            TextField("Current Location", text: $location)}
                       HStack{
                            Image (systemName: "mappin.and.ellipse")
                               .foregroundColor(.red)
                           TextField("230 N Craig St, Pittsburgh, PA, 15213", text: $destination)}
                                    
                }
                .ignoresSafeArea(.all, edges: .bottom)
                .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                Divider()
                ZStack {
                  MapView()
                }
                      .frame(height:480)
                      .padding()

           
                VStack(alignment: .leading) {
                        Button {
                            showDetail.toggle()
                            } label: {
                                HStack {
                                    Image (systemName: "bus")
                                        .foregroundColor(.white)
                                    Text("Bus Route")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            }
                }
                        .sheet(isPresented: $showDetail) {
                            BusTable()
                        }
                        .buttonStyle(ParkButton())
                    
 
            

            
            }.padding(.top,-40)
            
            Divider()
        }
    }
    
}


struct BusView_Previews: PreviewProvider {
    static var previews: some View {
        
        BusView()
            .previewDevice("iPhone 13 Pro")

    }
}

