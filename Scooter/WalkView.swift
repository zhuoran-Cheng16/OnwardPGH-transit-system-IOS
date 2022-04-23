//
//  WalkView.swift
//  Landmarks
//
//  Created by xinyue xie on 2022/3/19.
//

import SwiftUI

struct WalkView: View {
    @State private var isDisplayed = true
    @State var location: String = ""
    @State var destination: String = ""
    @StateObject private var viewModel = MapViewModel()
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
                OriginalMapView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 190)
                VStack(alignment: .leading) {
                    HStack {
                        Image (systemName: "figure.walk")
                            .foregroundColor(.blue)
                        Text("Walk Route")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Divider()
                    Text("Route 1")
                        .font(.largeTitle)
                    HStack {
                        Spacer()
                        Image(systemName: "figure.walk")
                            .padding(.trailing)
                            .font(.title)
                            .foregroundColor(.green)
                        Text("30 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image (systemName: "checkmark.circle")
                            .foregroundColor(.green)
                        Text("Smoother Route")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    Divider()
                }.padding()
                VStack(alignment: .leading){
                    Text("Route 2")
                        .font(.largeTitle)
                    HStack{
                        Image(systemName: "exclamationmark.circle")
                            .foregroundColor(.red)
                        Text("Faster but Little bumpy")
                            .font(.subheadline)
                            .foregroundColor(.red)
                        Spacer()
                        Image(systemName: "figure.walk")
                            .padding(.trailing)
                            .font(.title)
                            .foregroundColor(.red)
                        Text("26 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Divider()
                    
                }.padding()

            }
                .navigationBarTitle("User Input")
            
            }
    }
}
struct WalkView_Previews: PreviewProvider {
    static var previews: some View {
        
        WalkView()
            .previewDevice("iPhone 13 Pro")

    }
}
