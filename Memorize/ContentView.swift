//
//  ContentView.swift
//  Memorize
//
//  Created by Ha Vu Son Kiem on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.white))
                Text("🙆‍♂️").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 12))
        }
        
    }
}

#Preview {
    ContentView()
}
