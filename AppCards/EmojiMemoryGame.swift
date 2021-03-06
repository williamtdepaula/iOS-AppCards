//
//  EmojiMemoryGame.swift
//  AppCards
//
//  Created by William TristΓ£o de Pauloa on 22/09/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis: Array<String> = [ "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π₯", "π₯", "π", "π", "π₯", "π₯", "π½", "πΆ", "π₯", "π ", "π°", "π₯", "π―", "π₯", "π", "π₯", "π§", "π₯", "π³", "π₯", "π₯", "π€", "π",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6, createCardContent: {index in emojis[index] })
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent
    
    func chooseCard(_ card: Card) -> Void{
        model.choose(card)
    }
}
