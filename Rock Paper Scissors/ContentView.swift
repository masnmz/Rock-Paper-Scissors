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
        ZStack {
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 600)
            VStack {
                Spacer()
                Text("Your Score: \(userScore)")
                    .padding(50)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                Text("Computers choice is: \(listOfChoices[computerChoice])")
                    .padding()
                    .frame(minWidth: 100, maxWidth: .infinity)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                
                Text("Your aim: To \(winOrLose[winLose])")
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.purple)
                    .font(.largeTitle)
                    .cornerRadius(30)
                Spacer()
                
                Text("Choose Your Move")
                    .foregroundStyle(.white)
                    .padding()
                HStack(spacing: 30){
                    Button("Rock"){
                        usersChoice = "Rock"
                        result()
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    
                    Button("Paper"){
                        usersChoice = "Paper"
                        result()
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    
                    Button("Scissors"){
                        usersChoice = "Scissors"
                        result()
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                }
                Spacer()
                
            }
            .alert("Game Over", isPresented: $gameOver) {
                Button("Restart") {
                    reset()
                }
            }message: {
                Text("Final Score: \(userScore)")
            }
        }.ignoresSafeArea()
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
