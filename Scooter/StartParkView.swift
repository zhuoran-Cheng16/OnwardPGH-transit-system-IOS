//
//  StartParkView.swift
//  Scooter
//
//  Created by Alexandra Poltorak on 4/20/22.
//
import SwiftUI

struct StartParkView: View {
    
    @State var time: Int = 0 // will be represented in minutes
    @Binding var showDetail: Bool
    @State private var displayPopupMessage: Bool = false
    var body: some View {
        VStack {
            HStack {
                CircleButton(imageName: "minus.circle.fill", functionality: "subtract", time: $time)
                Text("\(time/60):\(time%60 != 0 ? time%60 : 0)")
                    .background(Rectangle().fill(Color.gray))
                    .font(.largeTitle)
                CircleButton(imageName: "plus.circle.fill", functionality: "add", time: $time)
                
            }
            .padding()
            Button (action: {
                self.displayPopupMessage = true
            }) {
                Text("Submit Time Staying").font(.title)
            }
            .alert(isPresented: $displayPopupMessage){
                Alert(
                    title: Text("Parking"),
                    message: Text("You have submitted that you will be parked in the lot for \(time/60) hours and \(time%60 != 0 ? time%60 : 0) minutes"),
                    primaryButton: Alert.Button.default(Text("Edit"), action: {}),
                    secondaryButton: Alert.Button.cancel(Text("Confirm"), action: {showDetail = false})
                    )
            }
        }
        .padding()
    }
}

//struct StartParkView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartParkView(showDetail: true)
//    }
//}
/*
 Got code below from: https://anthonycodesofficial.medium.com/swiftui-tutorial-how-to-create-a-circle-button-using-neumorphic-design-5a1aa40bb14b
 */
struct CircleButton: View {
    
    var imageName: String
    var functionality: String
    @Binding var time: Int
    
    var image: Image {
        Image(systemName: imageName)
    }
    
    var body: some View {
        Button(action: {
            if functionality == "add" {
                time = time + 5
            }
            else if functionality == "subtract" && time != 0{
                time = time - 5
            }
        }) {
            image
                .imageScale(.large)
        }
        .clipShape(Circle())
        .frame(width: 100.0, height: 100.0)
    }
}
