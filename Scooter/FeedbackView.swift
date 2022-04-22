//
//  FeedbackView.swift
//  Scooter
//
//  Created by 然 on 2022/4/5.
//

import SwiftUI
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
    @State var textFieldOn = false
    @State var comment = ""
    @State var commentSubmitted = false
    @Binding var showDetail: Bool
    @State var showThanksAlert = false
    
    @State var discomfortFeedbackCollected = false
    @State var missingFeedbackText = false
    @State var presentingDone = false
    
    var body: some View {
        VStack {
            Text("How was your trip?")
                .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
            HStack{
                Button(action:{
                    feedback="very_bad"
                    textFieldOn = true
                    
                }) {
                    HStack {
                        Text(button1)
                            .font(.largeTitle)
                    }.padding(10.0)
                        
            
                    }
                
                Button(action:{
                    feedback="bad"
                    textFieldOn = true
                }) {
                    HStack {
                        Text(button2)
                            .font(.largeTitle)
                    }.padding(10.0)
            
                    }
                
                Button(action:{
                    feedback="average"
                    textFieldOn = true
                }) {
                    HStack {
                        Text(button3)
                            .font(.largeTitle)
                    }.padding(10.0)
            
                    }
                Button(action:{
                    feedback="prefect"
                    textFieldOn = true
                }) {
                    HStack {
                        Text(button4)
                            .font(.largeTitle)
                    }.padding(10.0)
           
                    }
                }.buttonStyle(GrowingButton())
                .padding()
            if feedback != "" {
                HStack {
                    Text("You have selected: ")
                        .fontWeight(.heavy)
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    Text(getResponseWithEmoji(feedback))
                        .fontWeight(.heavy)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding()
                }
            }
            
            //////////////////////// INSERT 4 BUTTONS OF WHY TRIP WAS BAD HERE :: START ////////////////////////
            if textFieldOn {
                VStack {
                    HStack { // top two buttons
                        Button("Bumps", action: {discomfortFeedbackCollected = true})
                        Button("Hills", action: {discomfortFeedbackCollected = true})
                    }
                    HStack { // bottom two buttons
                        Button("Construction", action: {discomfortFeedbackCollected = true})
                        Button("Road Closure", action: {discomfortFeedbackCollected = true})
                    }
                }
            }
            
            //////////////////////// INSERT 4 BUTTONS OF WHY TRIP WAS BAD HERE :: END ////////////////////////
            
            
            if textFieldOn && discomfortFeedbackCollected {
                VStack {
                    TextField("Please write any additional comments here", text: $comment)
                        .multilineTextAlignment(.center)
                    Button("Submit", action: {
                        commentSubmitted = true
                        showThanksAlert = true
                        presentingDone = showThanksAlert && textFieldOn && discomfortFeedbackCollected
                    })
                    .alert(isPresented: $showThanksAlert) {
                            return Alert(title: Text("Thank you for submitting your feedback!"),
                                dismissButton:
                                .default(Text("Done"),
                                action: {

                                        showDetail = false
                                })
                            )
                        
                        }
                    }
                }
            if missingFeedbackText {
                Text("Missing either reaction to trip or reason for discomfort on trip!")
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
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

//struct FeedbackView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedbackView().previewDevice("iPhone 13 Pro")
//    }
//}
