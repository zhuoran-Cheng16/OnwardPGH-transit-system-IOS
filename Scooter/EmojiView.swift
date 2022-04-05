//
//  EmojiView.swift
//  Scooter
//
//  Created by 然 on 2022/4/5.
//

import SwiftUI

struct emojiView: View {
    
    // MARK:- PROPERTIES
    
    @Binding var selectedEmoji: String
    var emojiText: String
    
    // MARK:- BODY
    var body: some View {
        Button {
            withAnimation(.spring(response:0.3, dampingFraction: 0.5)){
                selectedEmoji = emojiText
            }
            
        } label:{
            Text(emojiText)
                .font(Font.custom("Avenir", size: 23))
        }
    }
}

struct emojiView_Previews: PreviewProvider {
    static var previews: some View {
        emojiView(selectedEmoji: "d", emojiText: "dd",
    }
}
