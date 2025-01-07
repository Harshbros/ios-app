//
//  progress bar.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import SwiftUI

struct progress_bar: View {
    
    var progress: CGFloat
    var body: some View{
        
        
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor (Color(hue: 1.0, saturation: 0.0,brightness: 0.564, opacity: 0.327))
                .cornerRadius (18)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor (Color (.black))
                .cornerRadius (16)
        }
    }
}
   
        struct ProgressBar_Previews: PreviewProvider {
            static var previews: some View{
    progress_bar (progress: 50)
    
                    }
                    }
