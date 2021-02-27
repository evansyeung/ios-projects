//
//  ContentView.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/26/21.
//

import SwiftUI

struct ContentView: View {
    @State private var alertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            // Color views take up the whole screen
            // Hex #F3F8FD or rgb(243, 248, 253)
            // In order to use rgb you need to convert the by dividing by 255.0
            // Color(red: 243.0 / 255.0, green: 248.0 / 255.0, blue: 253.0 / 255.0)
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    // Instead of hard coding a font size, use built-in dynamic sizing
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                Text(String(game.target))
                    .kerning(1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color("TextColor"))
                HStack {
                    Text("1")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    // Default value binding to state variable, in range 1 to 100
                    // need $ convert a state variable to a binding
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                }
                    .padding()
                Button(action: {
                    alertVisible = true
                }) {
                    Text("Hit Me".uppercased())
                        .bold()
                        .font(.title3)
                }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .alert(isPresented: $alertVisible, content: {
                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(
                        title: Text("Hello there!"),
                        message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."),
                        dismissButton: .default(Text("Awesome!"))
                    )
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // Can add a second preview
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            // Line adds dark mdoe
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
