//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tobi Oguntuase on 3/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var players = ["Lebron James","Stephen Curry","Kyire Irving","Michael Jordan","Kawhi Leonard","Klay Thompson","Luka Doncic","Damian Lillard","Russell Westbrook","Giannis Antetokounmpo","Kobe Bryant"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    
    
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Player")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Which one is ")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                        
                        Text(players[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.white)
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        } label: {
                            Image(players[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(playerScore)")
                    .foregroundStyle(.secondary)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message : {
                Text("Your score is \(playerScore)")
            }
        }
    func flagTapped(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Correct"
            playerScore += 1
        } else {
            scoreTitle = "Wrong, that's \(players[number])"
            playerScore -= 1
        }
        showingScore = true
    }
    func askQuestion() {
        players.shuffle()
        correctAnswer = Int.random(in: 0...2)
        showingScore = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
