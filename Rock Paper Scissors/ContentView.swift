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
        Text("Your aim to \(winOrLose[winLose])")
        HStack(spacing: 30){
            Button("Rock"){
                print("User Chose Rock")
            }
            Button("Paper"){
                print("User Chose Paper")
            }
            Button("Scissors"){
                print("User Chose Scissors")
            }
        }
    }
}

#Preview {
    ContentView()
}
