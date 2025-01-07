//
//  link.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import SwiftUI

struct link: View {
    @EnvironmentObject var questionmanager: File
    var body: some View {
        if questionmanager.reachedEnd {
                   VStack(spacing: 20) {
                       Text("Quiz Game")
                           .title()
                     
                       Text("Congratulations, you completed the game! 🥳")
                       
                       Text("You scored \(questionmanager.score) out of \(questionmanager.length)")
                       
                       Button { 
                           Task.init {
                               await questionmanager.fetchTrivia()
                           }
                       } label: {
                           login(text: "Play again")
                       }
                   }
                   .foregroundColor(Color("AccentColor"))
                   .padding()
                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                   .background(Color(red: 0.98, green: 0.92, blue: 0.84))
               } else {
                   QuestionView().environmentObject(questionmanager)
               }
    }
}

#Preview {
    link()
        .environmentObject(File())
}
