//
//  ContentView.swift
//  AppCounter
//
//  Created by William Tristão de Pauloa on 20/09/21.
//

import SwiftUI


struct ContentView: View {
    let options: Array<String> = ["👻", "🏎", "🦈", "🌭", "🏎"].shuffled()
    
    var body: some View {
        return VStack{
            HStack {
                ForEach(0..<options.count, id: \.self){
                    index in CardView(char: options[index])
                }
            }.foregroundColor(.orange)
            .padding()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Button")
            })
        }
    }
}

struct CardView: View{
    let char: String;
    
    @State var isFaceUp: Bool = false;
    
    func onTapCard() -> Void {
        isFaceUp = !isFaceUp
    }
    
    var body: some View{
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2.0)
                Text(char)
            } else {
                RoundedRectangle(cornerRadius: 10.0);
            }
        }
        .onTapGesture(perform: onTapCard)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
