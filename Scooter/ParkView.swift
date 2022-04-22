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
    @State private var displayPopupMessage: Bool = false
    @State var showDetail: Bool = false
    var body: some View {
        NavigationView {
            VStack{
                HStack{
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
                }.padding(.top, 50)
                 .ignoresSafeArea(edges: .top)
                 .padding(.bottom, 600)
            VStack{
                ParkingMapView()
                HStack{
                NavigationLink(destination: StartParkView(showDetail: $showDetail), isActive: self.$showDetail) { EmptyView() }
                        Button(action: {
                            self.displayPopupMessage = true
                        }) {Text("Start Parking")}
                        .alert(isPresented: $displayPopupMessage){
                            Alert(title: Text("Parking"), message: Text("How long will you be parked in the lot?"), dismissButton:
                                .default(Text("Submit Time"), action: {self.showDetail = true}))
                    }
                }
                    }.ignoresSafeArea(edges: .top)
                        .padding(.top, -650)
        }
        }.navigationBarTitle("User Input")
    }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        
        ParkView()
            .previewDevice("iPhone 13 Pro")

    }
}
//    ZStack{
//        NavigationLink(destination: StartParkView(showDetail: $showDetail), isActive: self.$showDetail) { EmptyView() }
//        Button(action: {
//            self.displayPopupMessage = true
//        }) {Text("Start Parking")}
//        .alert(isPresented: $displayPopupMessage){
//            Alert(title: Text("Parking"), message: Text("How long will you be parked in the lot?"), dismissButton:
//                .default(Text("Submit Time"), action: {self.showDetail = true})
//            )
//        }.ignoresSafeArea(edges: .top)
//        ParkingMapView()
//            .ignoresSafeArea(edges: .top)
//            .frame(height: 189)
