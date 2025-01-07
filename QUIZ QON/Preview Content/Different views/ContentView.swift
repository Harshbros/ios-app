//
//  ContentView.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var questionmanager = File()
    @State private var username: String = "" // State variable for the username input

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Title and Subtitle
                VStack(spacing: 15) {
                    Text("Welcome to the Game")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Start the quiz")
                        .foregroundColor(.pink)
            .font(.headline)
                }
                
                // Username Input Field
                VStack(alignment: .leading, spacing: 10) {
                    Text("Username")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    TextField("Enter your username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .textInputAutocapitalization(.none)
                }
                .padding(.horizontal, 20) // Add padding for alignment

                // Navigation Link to Start Game
                NavigationLink {
                    link().environmentObject(questionmanager)
                } label: {
                    login(text: "Login")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 28 / 255, green: 19 / 255, blue: 96 / 255)) // Normalized RGB values
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
