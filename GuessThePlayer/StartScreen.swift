//
//  StartScreen.swift
//
//  Created by Stephanie Salgado on 4/26/23.
//

import SwiftUI

struct StartScreen: View {
    @State var animate: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("StartImg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Play Game")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .font(.system(size: 75))
                        .shadow(color: Color.black,
                                radius: 4, x: 6.5 , y: 6.5)
                    
        
                    
                    NavigationLink(destination: ContentView(), label: {
                        Image(systemName: "play.circle")
                            .padding(.top)
                            .font(.system(size:100))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black, radius: animate ? 30:10, x: 6.5, y: 6.5)
                            .scaleEffect(animate ? 1 : 0.8)
                            .offset(y: animate ? -7 : 0)
                    }) .padding(.horizontal, animate ? 30:70)
                }.onAppear(perform: addAnimation)
            }
        }
    }
    
    func addAnimation(){
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation .easeInOut(duration: 4.0) .repeatForever())
            {
                animate.toggle()
            }
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View{
        StartScreen()
    }
}
                                      

