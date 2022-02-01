//
//  ContentView.swift
//  SB_HW3.4
//
//  Created by Vladislav Kulak on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    
    @State private var showScore = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            
            HStack{
                Text("0")
                
                SliderViewKit(currentValue: $currentValue, opacity: computeScore())
                
                Text("100")
            }
            
            ButtonActionView(text: "Проверь меня", action: showScoreModal)
                .alert("Ваш результат: \(computeScore())", isPresented: $showScore) {
                    Button("OK", role: .cancel) { }
                }
            
            ButtonActionView(text: "Начать заново", action: resetGame)
        }
    }
    
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func showScoreModal() {
        showScore = true
    }
    
    private func resetGame() {
        targetValue = Int.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
