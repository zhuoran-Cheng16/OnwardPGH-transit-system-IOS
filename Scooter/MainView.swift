//
//  MainView.swift
//  Scooter
//
//  Created by xinyue xie on 2022/3/19.
//

import SwiftUI

struct MainView: View {
    
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            BusView()
                .tabItem{
                    Image(systemName: "bus")
                    Text("Bus")
                }
            ContentView()
                .tabItem{
                    Image(systemName: "scooter")
                    Text("Ride")
                }
            ParkView()
                .tabItem{
                    Image(systemName: "parkingsign")
                    Text("Park")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice("iPhone 13 Pro")
    }
}
