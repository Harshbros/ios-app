//
//  File.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-25.
//

import Foundation
import SwiftUI

class File: ObservableObject {
   
    private(set) var trivia: [questionare.Result] = []
    @Published private(set) var length = 0
    
   
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    
    
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    
   
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
   
    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    
    func fetchTrivia() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                           print("Error: Invalid server response")
                           return
                       }

            let decoder = JSONDecoder()
           
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(questionare.self, from: data)

            DispatchQueue.main.async {
                
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false

                // Set new values for all variables
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    
   
    func goToNextQuestion() {
       
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            
            reachedEnd = true
        }
    }
    
   
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)

       
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
   
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        // If answer is correct, increment score
        if answer.isCorrect {
            score += 1
        }
    }
}
