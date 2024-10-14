//
//  ContentView.swift
//  Memorize
//
//  Created by Ha Vu Son Kiem on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🙆‍♂️", "💕", "🍗", "🐧","🙆‍♂️", "💕", "🍗", "🐧"].shuffled()
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))] ) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
            
        }
    }
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 0 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
                .imageScale(.large)
                .font(.largeTitle)
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
                .imageScale(.large)
                .font(.largeTitle)
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    
    var body: some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
