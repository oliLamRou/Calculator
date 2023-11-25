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
    
//    var buttonColor: Color {
//        switch
//    }
        
    var zeroButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 175, height: 82)
                .foregroundColor(.buttonDarkGray)
            Text(calculatorButtons[16])
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("1000")
                        .font(.system(size: 80))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, -10)
                }
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<16) { index in
                        calculatorButton(index)
                    }
                }
                HStack {
                    zeroButton
                    calculatorButton(17)
                    calculatorButton(18)
                }
            }
            .padding()
        }
    }
        
    @ViewBuilder
    func calculatorButton(_ index: Int) -> some View {
        let value = calculatorButtons[index]
        
        var color: Color {
            if index < 3 {
                return .buttonGray
            }
            if [3,7,11,15,18].contains(where: {$0 == index}) {
                return .buttonOrange
            }
            return Color(.buttonDarkGray)
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
