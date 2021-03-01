//
//  TextViews.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/27/21.
//

import SwiftUI

struct InstructionText: View {
    // Allows us to pass in a text argument
    var text: String

    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            // Instead of hard coding a font size, use built-in dynamic sizing
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct BodyText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .padding()
            // .inifinity just says take as much space as possible
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}

struct ScoreText: View {
    var score: Int

    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date

    var body: some View {
        // Text has an initialize for accepting date types
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBoldText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 5.0) {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
