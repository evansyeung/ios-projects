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
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            // Button takes Action and Content
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
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

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        // Embed all the rings in a zstack so they are on top of each other
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            // ring is just the index
            ForEach(1..<6) { ring in
                // Circle takes CGFloat as size
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.8 * 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity), Color.white.opacity(0.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a Game instance particularlly for this preview
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
