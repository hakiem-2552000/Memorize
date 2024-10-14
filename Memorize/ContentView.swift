//
//  ContentView.swift
//  Memorize
//
//  Created by Ha Vu Son Kiem on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🙆‍♂️", "💕", "🍗", "🐧","🙆‍♂️", "💕", "🍗", "🐧"].shuffled()
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                ZStack {
                    base.strokeBorder(lineWidth: 2)
                        .background(base.foregroundColor(.white))
                    Text(content).font(.largeTitle)
                }
            } else {
                base.strokeBorder(lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 12))
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
