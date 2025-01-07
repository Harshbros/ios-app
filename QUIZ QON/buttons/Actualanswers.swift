//
//  Actualanswers.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import SwiftUI

struct Actualanswers: View {
    @EnvironmentObject var questionmanager: File
    
    
    var answer : Answer
    
    @State private var isSelected: Bool = false
    
    
    
    var green = Color(hue: 0.4, saturation: 0.7, brightness: 0.7)
    var red = Color(red: 0.7, green: 0.09, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "largecircle.fill.circle").font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ?  "checkmark.rectangle.portrait.fill" : "xmark.bin.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ? .white: .red)
        .background(.black)
        .cornerRadius(20)
        .shadow(color: isSelected ? (answer.isCorrect ? Color.green : Color.red) : Color.gray, radius: 5, x: 0.5, y: 0.5)        .onTapGesture {
            if !questionmanager.answerSelected {
                isSelected = true
                questionmanager.selectAnswer(answer: answer)
                isSelected = true
            }
        }
    }
}

struct Actualanswers_Previews: PreviewProvider{
    static var previews: some View{
        Actualanswers(answer: Answer(text: "NewDelhi",isCorrect: true))
        
            .environmentObject(File())
    }
}

