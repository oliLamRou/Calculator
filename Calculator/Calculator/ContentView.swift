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




let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("1000").font(.largeTitle)
            LazyVGrid(columns: columns) {
                 ForEach(Array(calculatorButtons), id: \.self) { value in
                     calculatorButton(value, .red)
                 }
            }.padding()
        }
    }
    
    /*:
     -note:
        - get the ZERO button to be large
        - Scale text without changing layout
        - get button color
     */
    
    @ViewBuilder
    func calculatorButton(_ value: String, _ color: Color) -> some View {
        let color = Color.gray
        ZStack {
            Circle().foregroundStyle(.red)
            Text(value)
        }
    }
}

#Preview {
    ContentView()
}
