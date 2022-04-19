//
//  ContentView.swift
//  Landmarks
//
//  Created by xinyue xie on 2022/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var isDisplayed = true
    @State var location: String = ""
    @State var destination: String = ""
    @State private var displayPopupMessage: Bool = false
    @State var showDetail: Bool = false
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
            VStack {
                NavigationLink(destination: FeedbackView(), isActive: self.$showDetail) { EmptyView() }
                Button(action: {
                    self.displayPopupMessage = true
                }) {Text("Trip Completed")}
                .alert(isPresented: $displayPopupMessage){
                    Alert(title: Text("Warning"), message: Text("This is a test"), dismissButton:
                        .default(Text("OK"), action: {self.showDetail = true})
                    )
                }
            }
                    
                MapView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 185)
                VStack(alignment: .leading) {
                    HStack {
                        Image (systemName: "scooter")
                            .foregroundColor(.blue)
                        Text("Scooter Route")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Divider()
                    Text("Route 1")
                        .font(.largeTitle)
                    HStack {
                        Spacer()
                        Image(systemName: "scooter")
                            .padding(.trailing)
                            .font(.title)
                            .foregroundColor(.green)
                        Text("12 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image (systemName: "checkmark.circle")
                            .foregroundColor(.green)
                        Text("Smoother Route and light condition ok")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    Divider()
                }.padding()
                VStack(alignment: .leading){
                    Text("Route 2")
                        .font(.largeTitle)
                    HStack{
                        Spacer()
                        Image(systemName: "scooter")
                            .padding(.trailing)
                            .font(.title)
                            .foregroundColor(.red)
                        Text("10 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundColor(.red)
                        Text("Faster and light condition ok but Little bumpy")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    Divider()
                    
                }.padding()

            }
                .navigationBarTitle("User Input")
            
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewDevice("iPhone 13 Pro")

    }
}
