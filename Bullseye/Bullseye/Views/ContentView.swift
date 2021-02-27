//
//  ContentView.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/26/21.
//

import SwiftUI

struct ContentView: View {
    @State private var alertVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    // Instead of hard coding a font size, use built-in dynamic sizing
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            HStack {
                Text("1")
                    .fontWeight(.bold)
                // Default value binding to state variable, in range 1 to 100
                // need $ convert a state variable to a binding
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .fontWeight(.bold)
            }
            Button(action: {
                self.alertVisible = true
            }) {
                Text("Hit Me")
            }
            .alert(isPresented: $alertVisible, content: {
                let roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(
                    title: Text("Hello there!"),
                    message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."),
                    dismissButton: .default(Text("Awesome!"))
                )
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // Can add a second preview
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
