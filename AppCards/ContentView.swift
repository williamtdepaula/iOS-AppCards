//
//  ContentView.swift
//  AppCounter
//
//  Created by William Tristão de Pauloa on 20/09/21.
//

import SwiftUI


struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
            ForEach(viewModel.cards) {
                card in
                CardView(card).aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture(perform:{
                        viewModel.chooseCard(card)
                    })
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .font(.largeTitle)
        .padding()
    }
    
    
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    
    init(_ card: MemoryGame<String>.Card){
        self.card = card
    }
    
    
    var body: some View {
        return ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10.0).strokeBorder(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let gameEmojiMemoryGameViewModel = EmojiMemoryGame()
        ContentView(viewModel: gameEmojiMemoryGameViewModel)
            .preferredColorScheme(.dark)
        ContentView(viewModel: gameEmojiMemoryGameViewModel)
            .previewDevice("iPad mini (5th generation)")
            .preferredColorScheme(.light)
    }
}
