//
//  test.swift
//  Scooter
//
//  Created by 然 on 4/25/22.
//

import SwiftUI

struct test: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
          Image(systemName: "fuelpump.fill")
          Text("Parking area 2")
                    .font(.title3)
          
           Text("$ 4/h")
                    .foregroundColor(.gray)
                    .padding(.leading, 30.0)
                
            }
          HStack {
              Text("Forbes Street   0.2km")
                  .font(.footnote)
                  .foregroundColor(.gray)
                  .padding(.top, -5)
          }

          HStack {
        
            Text("Open Now")
              .font(.subheadline)
              .foregroundColor(.green)
            Text("No parking 9am-4pm")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.leading)
          }
            HStack {
          
              Text("Avaliable Spots")
                .font(.subheadline)
                .foregroundColor(.green)
              Text("Except Sunday")
                  .font(.footnote)
                  .foregroundColor(.gray)
                  .padding(.leading)
            }
        }.padding()
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
