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
                    .frame(height: 170)
                VStack(alignment: .leading) {
                    HStack {
                        Image (systemName: "bus")
                            .foregroundColor(.blue)
                        Text("Bus Route")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Divider()
                    Text("61A")
                        .font(.body)
                    HStack {
                        Spacer()
                        Image(systemName: "figure.stand")
                            .padding(.trailing)
                            .font(.body)
                            .foregroundColor(.green)
                        Image(systemName: "figure.stand")
                            .font(.body)
                            .foregroundColor(.green)
                        Text("6 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image (systemName: "arrow.forward.circle.fill")
                            .foregroundColor(.gray)
                        Text("Downtown")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Text("Forbes Ave/Wightman")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("         Also in 37 min & 1h")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Divider()
                }.padding()
                VStack(alignment: .leading){
                    Text("61B")
                        .font(.body)
                    HStack{
                        Image(systemName: "exclamationmark.circle")
                            .foregroundColor(.red)
                        Text("Too many waiting")
                            .font(.subheadline)
                            .foregroundColor(.red)
                        Spacer()
                        Image(systemName: "figure.stand")
                            .padding(.trailing)
                            .font(.body)
                            .foregroundColor(.red)
                        Image(systemName: "figure.stand")
                            .font(.body)
                            .foregroundColor(.orange)
                        Text("6 Min")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image (systemName: "arrow.forward.circle.fill")
                            .foregroundColor(.gray)
                        Text("Downtown")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Text("Forbes Ave/Wightman")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("         Also in 37 min & 1h")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Divider()
                    
                }.padding()

            }
                    .navigationBarTitle("User Input")
            }
        
    }
}
struct BusView_Previews: PreviewProvider {
    static var previews: some View {
        
        BusView()
            .previewDevice("iPhone 13 Pro")

    }
}
