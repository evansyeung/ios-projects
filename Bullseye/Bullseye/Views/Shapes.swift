//
//  Shapes.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/27/21.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true

    var body: some View {
        VStack {
            if !wideShapes {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20.0)
                // frame() can be used on any view to set width and height
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                // Other transitions: .slide, .scale if you don't want to use default
                .transition(.opacity)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Button(action: {
                // withAnimation says we're changing a state propery and recompute the body view
                // When that happens we're expecting some of these shapes to change and use the default animation when that happens
                withAnimation{
                    // toggle() is basically wideShapes = !wideShapes
                    wideShapes.toggle()
                }
            }) {
                Text("Animate!")
            }
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
