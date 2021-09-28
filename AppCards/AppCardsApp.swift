//
//  AppCardsApp.swift
//  AppCards
//
//  Created by William Tristão de Pauloa on 21/09/21.
//

import SwiftUI

@main
struct AppCardsApp: App {
    let gameEmojiMemoryGameViewModel = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameViewModel: gameEmojiMemoryGameViewModel)
        }
    }
}
