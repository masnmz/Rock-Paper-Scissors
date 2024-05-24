//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Mehmet Alp Sönmez on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
    let listOfChoices = ["Rock", "Paper" , "Scissors"].shuffled()
    let winOrLose = ["Win", "Lose"].shuffled()
    
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var winLose = Int.random(in: 0..<2)
    @State private var gameCount = 0
    @State private var usersChoice = "Rock"
    @State private var userScore = 0
    @State private var gameOver = false
    
    
    var body: some View {
        VStack {
            Text("UserScore: \(userScore)")
                .padding(50)
                .font(.largeTitle)
            
        }
        Spacer()
        Text("Computers choice is: \(listOfChoices[computerChoice])")
            .padding()
            .frame(minWidth: 100, maxWidth: .infinity)
            .background(.blue)
            .cornerRadius(10)
        
        Text("Your aim: To \(winOrLose[winLose])")
            .padding()
            .font(.largeTitle)
        HStack(spacing: 30){
            Button("Rock"){
                usersChoice = "Rock"
                result()
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            
            Button("Paper"){
                usersChoice = "Paper"
                result()
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            
            Button("Scissors"){
                usersChoice = "Scissors"
                result()
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(.black)
            .clipShape(Capsule())
        }
        Spacer()
        
    }
        .alert("Game is over. Your score \(userScore)", isPresented: $gameOver) {
            Button{"Restart"} {
                reset()
            }
        }
    
    func reset() {
        gameOver = false
        gameCount = 0
        userScore = 0
        newRound()
        
    }
    
    func newRound() {
        computerChoice = Int.random(in: 0...2)
        winLose = Int.random(in: 0..<2)
        
    }
    
    func result() {
        if winOrLose[winLose] == "Win" && listOfChoices[computerChoice] == "Rock" && usersChoice == "Paper" {
            userScore += 1
        }
        else if winOrLose[winLose] == "Win" && listOfChoices[computerChoice] == "Rock" && usersChoice != "Paper" {
            userScore -= 1
        }
        else if winOrLose[winLose] == "Lose" && listOfChoices[computerChoice] == "Rock" && usersChoice != "Paper" {
            userScore += 1
        }
        else if winOrLose[winLose] == "Lose" && listOfChoices[computerChoice] == "Rock" && usersChoice == "Paper" {
            userScore -= 1
        }
        if winOrLose[winLose] == "Win" && listOfChoices[computerChoice] == "Paper" && usersChoice == "Scissors" {
            userScore += 1
        }
        else if winOrLose[winLose] == "Win" && listOfChoices[computerChoice] == "Paper" && usersChoice != "Scissors" {
            userScore -= 1
        }
        else if winOrLose[winLose] == "Lose" && listOfChoices[computerChoice] == "Paper" && usersChoice != "Scissors" {
            userScore += 1
        }
        else if winOrLose[winLose] == "Lose" && listOfChoices[computerChoice] == "Paper" && usersChoice == "Scissors" {
            userScore -= 1
        }
        if winOrLose[winLose] == "Win" && listOfChoices[computerChoice] == "Scissors" && usersChoice == "Rock" {
            userScore += 1
        }
        else if winOrLose[winLose] == "Win" && listOfChoices[computerChoice] == "Scissors" && usersChoice != "Rock" {
            userScore -= 1
        }
        else if winOrLose[winLose] == "Lose" && listOfChoices[computerChoice] == "Scissors" && usersChoice != "Rock" {
            userScore += 1
        }
        else if winOrLose[winLose] == "Lose" && listOfChoices[computerChoice] == "Scissors" && usersChoice == "Rock" {
            userScore -= 1
        }
        
        userScore = userScore < 0 ? 0 : userScore
        
        gameCount += 1
        if gameCount == 10 {
            gameOver = true
        } else {
            newRound()
        }
        
    }
}

#Preview {
    ContentView()
}
