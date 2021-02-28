//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/27/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
}

struct TopView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            // Extends the space between these two views (as much as possible)
            // This in effect pushs the views to the left and the right
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String

    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            // Extends the space between these two views (as much as possible)
            // This in effect pushs the views to the left and the right
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a Game instance particularlly for this preview
        BackgroundView(game: .constant(Game()))
    }
}
