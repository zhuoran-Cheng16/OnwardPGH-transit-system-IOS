//
//  StartView.swift
//  Scooter
//
//  Created by 吴祎凡 on 3/21/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        VStack(alignment: .leading){
            Text("Home Page")
                .font(.custom("Georgia", size: 24, relativeTo: .title))
                .padding()
            OriginalMapView()
                .padding(0.0)
                .ignoresSafeArea(edges: .top)}
                .onAppear{
                    viewModel.checkIfLocationServicesEnabled()};
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .previewDevice("iPhone 13 Pro")

    }
}
