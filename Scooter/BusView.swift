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
                ZStack{
                   MapView()
                    }.frame(height:500)
                    .padding()
               
                VStack(alignment: .leading) {
                        Button {
                            showDetail.toggle()
                            } label: {
                                HStack {
                                    Image (systemName: "bus")
                                        .foregroundColor(.blue)
                                    Text("Bus Route")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                }
                            }
                }.padding()
                        .sheet(isPresented: $showDetail) {
                            BusTable()
                        }
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


