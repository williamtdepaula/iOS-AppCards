//
//  EmojiMemoryGameView.swift
//  AppCounter
//
//  Created by William Tristão de Pauloa on 20/09/21.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: gameViewModel.cards, aspectRatio: 2/3){
            card in
            CardView(card).aspectRatio(2/3, contentMode: .fit)
                .onTapGesture(perform:{
                    gameViewModel.chooseCard(card)
                })
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .font(.largeTitle)
        .padding()
    }
    
    
}

struct CardView: View {
    
    let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card){
        self.card = card
    }
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        
        return GeometryReader{ geometry in
            ZStack{
                if card.isFaceUp {
                    shape.foregroundColor(.white).opacity(DrawingConstants.opacity)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Circle().foregroundColor(.red).opacity(0.5).padding(13)
                    Text(card.content).font(calcFontSize(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }else {
                    shape
                }
            }.padding(6)
        }
    }
    
    private func calcFontSize(in size: CGSize) -> Font {
        Font.system(size: (min(size.width, size.height) * DrawingConstants.fontScale))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.6
        static let opacity: Double = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let gameEmojiMemoryGameViewModel = EmojiMemoryGame()
        
        gameEmojiMemoryGameViewModel.chooseCard(gameEmojiMemoryGameViewModel.cards.first!)
        
        return EmojiMemoryGameView(gameViewModel: gameEmojiMemoryGameViewModel)
            .preferredColorScheme(.dark)
    }
}
