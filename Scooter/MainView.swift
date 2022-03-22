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
            StartView()
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
                    Text("Scooter")
                }
            WalkView()
                .tabItem{
                    Image(systemName: "figure.walk")
                    Text("Walk")
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
        MainView()
    }
}
