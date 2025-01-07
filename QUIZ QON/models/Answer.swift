//
//  Answer.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import Foundation


struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}

