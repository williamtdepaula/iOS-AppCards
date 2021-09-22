//
//  ContentView.swift
//  AppCounter
//
//  Created by William Tristão de Pauloa on 20/09/21.
//

import SwiftUI


struct ContentView: View {
    let options: Array<String> = ["👻", "🏎", "🦈", "🌭", "X", "F", "G", "H",].shuffled()
    
    @State var totalEmoji: Int = 4
    
    func addEmoji() -> Void{
        if totalEmoji < options.count{
            totalEmoji += 1
        }
    }
    
    func removeEmoji() -> Void{
        if totalEmoji > 1{
            totalEmoji -= 1
        }
    }
    
    var body: some View {
        return VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(options[0..<totalEmoji], id: \.self){
                    emoji in CardView(char: emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(.orange)
            .padding()
            
            Spacer()
            
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding()
        }
    }
    
    
    var add: some View {
        Button(action: addEmoji, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var remove: some View {
        Button(action: removeEmoji, label: {
            Image(systemName: "minus.circle")
        })
    }
}

struct CardView: View{
    let char: String;
    
    @State var isFaceUp: Bool = true;
    
    func onTapCard() -> Void {
        isFaceUp = !isFaceUp
    }
    
    var body: some View{
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(lineWidth: 4.0)
                Text(char)
            } else {
                RoundedRectangle(cornerRadius: 10.0);
            }
        }
        .onTapGesture(perform: onTapCard)
        .font(.largeTitle)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewDevice("iPad mini (5th generation)")
            .preferredColorScheme(.light)
    }
}
