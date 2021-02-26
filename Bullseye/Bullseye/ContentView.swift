//
//  ContentView.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/26/21.
//

import SwiftUI

struct ContentView: View {
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
                Text("89")
                    .kerning(1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            HStack {
                Text("1")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                // Default value to 50, in range 1 to 100
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            Button(action: {}) {
                Text("Hit Me")
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
    }
}
