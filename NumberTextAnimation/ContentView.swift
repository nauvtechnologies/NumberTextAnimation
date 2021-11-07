//
//  ContentView.swift
//  NumberTextAnimation
//
//  Created by Zack on 07/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var number: Double = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(number)")
                    .foregroundColor(Color.clear)
                    .animatableNumber(count: number)
                    .font(.system(size: 50, weight: .light, design: .default))
                    .foregroundColor(Color.black)
                
                Button(action: {
                    withAnimation(.easeOut(duration: 0.6)) {
                        self.number += 2300.0
                    }
                }, label: {
                    ZStack {
                        Rectangle()
                            .fill(Color.cyan)
                            .cornerRadius(7)
                            .frame(width: 100, height: 40, alignment: .center)
                        
                        Text("Animate")
                            .font(.system(size: 20, weight: .light, design: .default))
                            .foregroundColor(Color.white)
                    }
                })
            }
        }
    }
}

struct AnimatableCustomFontModifier: Animatable, ViewModifier {
    var count: Double

    var animatableData: CGFloat {
        get { count }
        set { count = newValue }
    }

    func body(content: Content) -> some View {
        content
            .overlay(Text(String(format: "%.0f", count)))
    }
}

extension View {
    func animatableNumber(count: Double) -> some View {
        self.modifier(AnimatableCustomFontModifier(count: count))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
