//
//  BusTable.swift
//  Scooter
//
//  Created by 然 on 4/23/22.
//

import SwiftUI

struct BusTable: View {
    var body: some View {
        VStack(alignment: .leading) {
                       HStack {
                           Image (systemName: "bus")
                               .foregroundColor(.blue)
                           Text("Bus Route")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                       }
                        Divider()
            VStack(alignment: .leading) {
                Text("61A")
                            .font(.title)
                            .padding(.leading)
                       HStack {
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.green)
           
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.green)
                           Text("6 Min")
                               .font(.title3)
                               .foregroundColor(.gray)
                       }
                       .padding(.leading, 240.0)
                       .frame(height: -10.0)
                       HStack {
                           Image (systemName: "arrow.forward.circle.fill")
                               .foregroundColor(.blue)
                               .padding(.leading)
                           Text("Downtown")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                       }
                       Text("Forbes Ave/Wightman")
                           .font(.subheadline)
                           .foregroundColor(.blue)
                           .padding(.leading)
                       Text("         Also in 37 min & 1h")
                           .font(.subheadline)}
                Divider()
            VStack(alignment: .leading){
                
                HStack{Text("61B")
                    .font(.title)
                    .padding(.leading)
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("Too many waiting")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                HStack{
           
                    HStack{
                    Image(systemName: "figure.stand")
                            .padding(.trailing)
                            .font(.body)
                            .foregroundColor(.red)
                    Image(systemName: "figure.stand")
                        .padding(.trailing)
                        .font(.body)
                        .foregroundColor(.orange)
                    Text("9 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                    }
                    .padding(.leading, 240.0)
                    

                }
                HStack {
                    Image (systemName: "arrow.forward.circle.fill")
                        .foregroundColor(.blue)
                        .padding(.leading)
                    Text("Downtown")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                Text("Forbes Ave/Wightman")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.leading)
                Text("         Also in 37 min & 1h")
                    .font(.subheadline)
                    .foregroundColor(.black)
            }

            Divider()
            VStack(alignment: .leading) {
                HStack{Text("61C")
                    .font(.title)
                    .padding(.leading)
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("No more boarding")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                       HStack {
                        
                    
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.red)
           
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.red)
                           Text("2 Min")
                               .font(.title3)
                               .foregroundColor(.gray)
                       }
                       .padding(.leading, 240.0)

                       HStack {
                           Image (systemName: "arrow.forward.circle.fill")
                               .foregroundColor(.blue)
                               .padding(.leading)
                           Text("Downtown")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                       }
                       Text("Forbes Ave/Wightman")
                           .font(.subheadline)
                           .foregroundColor(.blue)
                           .padding(.leading)
                       Text("         Also in 37 min & 1h")
                           .font(.subheadline)}
            Divider()
        }
            .foregroundColor(.black)
            .padding(.top, -300)
            
        
            
          
            
    }
        
    }

struct BusTable_Previews: PreviewProvider {
    static var previews: some View {
        BusTable().previewDevice("iPhone 13 Pro")
    }
}
