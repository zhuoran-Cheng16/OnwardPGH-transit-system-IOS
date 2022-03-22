//
//  StartView.swift
//  Scooter
//
//  Created by 吴祎凡 on 3/21/22.
//

import SwiftUI

struct StartView: View {


    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Map from data visualization")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            MapView()
                .padding(0.0)
                .ignoresSafeArea(edges: .top)
                .frame(height:150)
            HStack {
                Text("Map for bumpiness")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding(.leading, 60.0)
            }
            Divider()
            MapView()
                .padding(0.0)
                .ignoresSafeArea(edges: .top)
                .frame(height:150)
            HStack {
                Text("Map for light")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding(.leading, 60.0)
            }

            

        };
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        
        StartView()
            .previewDevice("iPhone 13 Pro")

    }
}
