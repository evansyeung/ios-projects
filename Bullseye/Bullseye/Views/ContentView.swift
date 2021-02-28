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
            // Color("BackgroundColor")
            //    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}

struct InstructionsView: View {
    // We need to create a binding for the @State game variable
    // This will get passed in as an arguement
    @Binding var game: Game

    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double

    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            // Default value binding to state variable, in range 1 to 100
            // need $ convert a state variable to a binding
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
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
        // An overlay is a view that gets drawn on top of everything else
        // An alternative to using a zstack
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
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
