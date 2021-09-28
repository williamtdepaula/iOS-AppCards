//
//  MemoryGame.swift
//  AppCards
//
//  Created by William Tristão de Pauloa on 22/09/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{ cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set{ cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) -> Void{
        if let chosenIndex = cards.firstIndex(where:{ $0.id == card.id}), !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            
            if let potentialMatch = indexOfTheOneAndOnlyFaceUpCard{
                print("teste \(chosenIndex)")
                if cards[chosenIndex].content == cards[potentialMatch].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else{
                print("teste2 \(chosenIndex)")
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let card: CardContent = createCardContent(pairIndex)
            
            cards.append(Card(id: pairIndex*2,content: card))
            cards.append(Card(id: pairIndex*2+1,content: card))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}


extension Array{
    var oneAndOnly: Element? {
        if(count == 1){
            return first
        }else{
            return nil
        }
    }
}
