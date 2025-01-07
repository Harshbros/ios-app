//
//  login.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import SwiftUI

                    
struct login: View {
    var text : String
    var background : Color = .blue
    var body: some View {
    
        Text(text)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(background)
                .cornerRadius(40)
                .shadow(radius: 10)
        
    }
}
struct PrimaryButton_Previews:PreviewProvider{
    static var previews: some View{
        login(text: "Login")
    }
    
}
