//
//  ContentView.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-23.
//

import SwiftUI

let calculatorButtons = [
        "c", "+/-", "%", "÷",
        "9", "8", "7", "x",
        "6", "5", "4", "-",
        "3", "2", "1", "+",
        "0", ".", "="
]

struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var roundButton: some View {
        Circle()
    }
    
    var body: some View {
        HStack {
            VStack {
                // top gray
                HStack {
                    roundButton
                    roundButton
                    roundButton
                }
                // number 1 to 9
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(1..<10) { value in
                        roundButton
                    }
                }
                //0.
                HStack {
                    RoundedRectangle(cornerRadius: 100).frame(width: 50)
                    roundButton
                }
            }
            // ÷x+-=
            VStack {
                roundButton
                roundButton
                roundButton
                roundButton
                roundButton
            }
        }
        
        
        ZStack {
            Rectangle().ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("1000")
                        .font(.system(size: 90))
                        .foregroundStyle(.white)
                        .padding()
                }
                LazyVGrid(columns: columns) {
                    ForEach(0..<calculatorButtons.count) { index in
                         calculatorButton(index)
                     }
                }.padding()
            }
        }
    }
    
    /*:
     -note:
        - get the ZERO button to fit
        - Total closer to button
     */
    
    @ViewBuilder
    func calculatorButton(_ index: Int) -> some View {
        let value = calculatorButtons[index]
        
        var color: Color {
            if index < 3 {
                return .gray
            }
            if [3,7,11,15,18].contains(where: {$0 == index}) {
                return .orange
            }
            return Color(.darkGray)
        }
        
        ZStack {
            if index == 16 {
                RoundedRectangle(cornerRadius: 50.0)
                    .foregroundStyle(color)
                    .frame(width: 100)
            } else {
                Circle().foregroundStyle(color)
            }
            Text(value)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
