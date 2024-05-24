//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Mehmet Alp Sönmez on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
    let listOfChoices = ["Rock", "Paper" , "Scissors"]
    let winOrLose = ["Win", "Lose"].shuffled()
    
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var winLose = Int.random(in: 0..<2)
    @State private var gameCount = 0
    @State private var usersChoice = "Rock"
    
    var body: some View {
        Text("Computers choice is: \(listOfChoices[computerChoice])")
            .padding()
            .frame(minWidth: 100, maxWidth: .infinity)
            .background(.blue)
            .cornerRadius(10)
        
        Text("Your aim to \(winOrLose[winLose])")
            .padding()
            .font(.largeTitle)
        
        HStack(spacing: 30){
            Button("Rock"){
                usersChoice = "Rock"
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            
            Button("Paper"){
                usersChoice = "Paper"
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            
            Button("Scissors"){
                usersChoice = "Scissors"
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(.black)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    ContentView()
}
