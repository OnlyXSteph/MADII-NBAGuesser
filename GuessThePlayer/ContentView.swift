import SwiftUI

struct ContentView: View {
    @State private var players = ["Damian", "Giannis", "Kawhi", "Klay", "Kobe", "Kyrie", "Lebron", "Luka", "Michael", "Russell", "Shaq", "Stephen"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    
    
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.8, green: 0.2, blue: 0.2),
                     location: 0.99),
                .init(color: Color(red: 0.1, green: 0.0, blue: 0.5),
                      location: 0.99),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Player")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                
                VStack(spacing: 20) {
                    VStack {
                        
                        Text("Which of these is ")
                            .font(.title.weight(.semibold))
                            .foregroundColor(.black)
                            .padding(.top)
                        
                        Text(players[correctAnswer] + "?")
                            .font(.title.weight(.semibold))
                            .foregroundColor(.black)
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            playerTapped(number)
                        } label: {
                            Image(players[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                                
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .padding(.vertical, 25)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Current Score: \(playerScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message : {
                Text("Your score is now \(playerScore).")
            }
        }
    func playerTapped(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Correct!"
            playerScore += 1
        } else {
            scoreTitle = "Wrong, that's \(players[number])!"
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
