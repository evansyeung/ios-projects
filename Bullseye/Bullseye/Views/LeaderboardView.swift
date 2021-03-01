//
//  Leaderboard.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/28/21.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardVisible: Bool
    @Binding var game: Game

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 10) {
                HeaderView(leaderboardVisible: $leaderboardVisible, text: "Leaderboard")
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        // game.leaderboardEntries.indices returns all of the indices in the array
                        ForEach(game.leaderboardEntries.indices) { index in
                            let leaderboardEntry = game.leaderboardEntries[index]
                            RowView(index: index+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date

    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            // Using .infinity for cornerRadius basic just makes it perfectly round (semi-circle)
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardVisible: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var text: String

    var body: some View {
        ZStack {
            HStack {
                // Portrait mode
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: text)
                    // iPhone 12 not needed
                    //  Spacer()
                } else {
                    BigBoldText(text: text)
                        .padding(.leading)
                }
            }
            .padding(.top)
            HStack {
                // We want the BigBoldText to be centered and everything in HStack to be right justified
                Spacer()
                Button(action: {
                    leaderboardVisible = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            // By default spacers expand to fill the amount of area thats available but you can can actually set them to be a fixed width if you want
            Spacer()
                .frame(width: Constants.General.roundRectViewLength)
            // Use spacers to line up our column label
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct Leaderboard_Previews: PreviewProvider {
    // For binding variables we need to create this binding constant
    static private var leaderboaredVisible = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))

    static var previews: some View {
        LeaderboardView(leaderboardVisible: leaderboaredVisible, game: game)
        // Can add a second preview
        LeaderboardView(leaderboardVisible: leaderboaredVisible, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardVisible: leaderboaredVisible, game: game)
            // Line adds dark mdoe
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardVisible: leaderboaredVisible, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
