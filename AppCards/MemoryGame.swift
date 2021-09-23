//
//  MemoryGame.swift
//  AppCards
//
//  Created by William Tristão de Pauloa on 22/09/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let card: CardContent = createCardContent(pairIndex)
            
            cards.append(Card(id: pairIndex*2,content: card))
            cards.append(Card(id: pairIndex*2+1,content: card))
        }
    }
    
    func choose(_ card: Card) -> Void{
        let chosenIndex = index(of: card)
        var chosenCard = cards[chosenIndex]
        chosenCard.isFaceUp.toggle()
        
        print(chosenIndex)
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return -1
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
