//
//  FeedbackView.swift
//  Scooter
//
//  Created by 然 on 2022/4/5.
//

import SwiftUI
import Alamofire
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct FeedbackView: View {
    @State var button1="😣"
    @State var button2="☹️"
    @State var button3="😐"
    @State var button4="😍"
    @State private var feedback = ""
    @State private var date = Date()
    var body: some View {
        VStack {
            Text("How was your trip?")
                .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
            HStack{
                Button(action:{
                    feedback="very_bad"}) {
                    HStack {
                        Text(button1)
                            .font(.largeTitle)
                    }.padding(10.0)
                        
            
                    }
                
                Button(action:{
                    feedback="bad"
                    
                }) {
                    HStack {
                        Text(button2)
                            .font(.largeTitle)
                    }.padding(10.0)
            
                    }
                
                Button(action:{
                    feedback="average"
                }) {
                    HStack {
                        Text(button3)
                            .font(.largeTitle)
                    }.padding(10.0)
            
                    }
                Button(action:{
                    feedback="prefect"
                }) {
                    HStack {
                        Text(button4)
                            .font(.largeTitle)
                    }.padding(10.0)
           
                    }
                }.buttonStyle(GrowingButton())
            if feedback != "" {
                Text(getResponseWithEmoji(feedback))
                    .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .font(.subheadline)
                Text("Thanks for feedback!")
                    .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .font(.subheadline)
            }
            
        }
            }
    func getResponseWithEmoji(_ emoji: String) -> String {
        switch feedback {
        case "very_bad":
            return "Very Bad"
        case "bad":
            return "Bad"
        case "average":
            return "Average"
        case "prefect":
            return "Perfect"
        default:
            return ""
        }


        }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView().previewDevice("iPhone 13 Pro")
    }
}
