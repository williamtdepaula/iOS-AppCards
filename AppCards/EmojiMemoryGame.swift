//
//  EmojiMemoryGame.swift
//  AppCards
//
//  Created by William Tristão de Pauloa on 22/09/21.
//

import SwiftUI


class EmojiMemoryGame {
    static let emojis: Array<String> = [ "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍", "🥝", "🥑", "🍅", "🍆", "🥒", "🥕", "🌽", "🌶", "🥔", "🍠", "🌰", "🥜", "🍯", "🥐", "🍞", "🥖", "🧀", "🥚", "🍳", "🥓", "🥞", "🍤", "🍗",].shuffled()
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10, createCardContent: {index in emojis[index] })
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent
    
    func chooseCard(_ card: MemoryGame<String>.Card) -> Void{
        model.choose(card)
    }
}
