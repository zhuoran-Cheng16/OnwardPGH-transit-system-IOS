//
//  FeedbackView.swift
//  Scooter
//
//  Created by 然 on 2022/4/5.
//

import SwiftUI

struct FeedbackView: View {
    @State var button1="Happy"
    @State var button2="Sad"
    
    var body: some View {
        VStack {
                Text("Please choose one")
                    .foregroundColor(.blue)
                    
                Button(action:{
                    print(button1)
                }) {
                    HStack {
                        Image(systemName: "face.smiling")
                        Text(button1)
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                        )
                    }
                Button(action:{
                    print(button2)
                }) {
                    HStack {
                        Image(systemName: "exclamationmark.circle.fill")
                        Text(button2)
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                        )
                    }
                    
                    Spacer()
                }
            }

        }

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView().previewDevice("iPhone 13 Pro")
    }
}
