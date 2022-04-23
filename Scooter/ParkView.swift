//
//  ParkView.swift
//  Scooter
//
//  Created by Zitan Chen on 3/21/22.
//
import SwiftUI

struct ParkButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct ParkView: View {
    @State private var isDisplayed = true
    @State var location: String = ""
    @State var destination: String = ""
    @State private var displayPopupMessage: Bool = false
    @State var showDetail: Bool = false
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                List{
                        HStack{
                            Image (systemName: "circle")
                            .foregroundColor(.gray)
                            TextField("Current Location", text: $location)}
                        HStack{
                            Image (systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                            TextField("Destination", text: $destination)}
                    
                }.listStyle(GroupedListStyle())
                    
                Divider()
                VStack{
                   ParkingMapView()
                    }.frame(height:445)
                   
                    
                
                VStack{
                    NavigationLink(destination: StartParkView(showDetail: $showDetail), isActive: self.$showDetail) { EmptyView() }
                            Button(action: {
                                self.displayPopupMessage = true
                            }) {Text("Start Parking")}
                            .buttonStyle(ParkButton())
                            .alert(isPresented: $displayPopupMessage){
                                Alert(title: Text("Parking"), message: Text("How long will you be parked in the lot?"), dismissButton:
                                    .default(Text("Submit Time"), action: {self.showDetail = true}))
                        }
                    
                }.padding()
                
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
