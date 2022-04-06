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
            Text("Map from data visualization")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            MapView()
                .padding(0.0)
                .ignoresSafeArea(edges: .top)
                
            
            

            

        };
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        
        StartView()
            .previewDevice("iPhone 13 Pro")

    }
}
