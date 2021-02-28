//
//  PointsView.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/28/21.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.calculatePoints(sliderValue: Int(sliderValue))

        VStack(spacing: 10.0) {
            InstructionText(text: "The slider's value is".uppercased())
            BigNumberText(text: "\(roundedValue)")
            BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
            Button(action: {
                alertVisible = false
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())

    static var previews: some View {
        PointsView(alertVisible: alertVisible, sliderValue: sliderValue, game: game)
        // Can add a second preview
        PointsView(alertVisible: alertVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertVisible: alertVisible, sliderValue: sliderValue, game: game)
            // Line adds dark mdoe
            .preferredColorScheme(.dark)
        PointsView(alertVisible: alertVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
