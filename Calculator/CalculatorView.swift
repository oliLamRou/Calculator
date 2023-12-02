//
//  ContentView.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-23.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var calculatorLogic: CalculatorLogic
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            VStack {
                Spacer()
                resultView
                buttonView
            }
        }
    }
    
    var resultView: some View {
        HStack {
            Spacer()
            Text(calculatorLogic.number ?? "0")
                .font(.system(size: 80))
                .bold()
                .foregroundStyle(.white)
                .padding(.vertical, -10)
                .padding(.horizontal)
            
        }
    }
    
    var buttonView: some View {
        VStack(spacing: 0) {
            ForEach(buttonLayout, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(row, id: \.self) { op in
                        Button {
                            calculatorLogic.result(op)
                        } label: {
                            ZStack {
                                //then be easy to set w and h base on display size
                                RoundedRectangle(cornerRadius: op.buttonHeight)
                                    .frame(
                                        width: op.buttonWidth,
                                        height: op.buttonHeight
                                    )
                                    .foregroundStyle(op.buttonColor)
                                Text(op.rawValue)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .padding()
                            }
                        }.padding(op.buttonPadding)
                    }
                }
            }
        }
    }
}

#Preview {
    CalculatorView(calculatorLogic: CalculatorLogic())
}
