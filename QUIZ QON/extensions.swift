//
//  extensions.swift
//  QUIZ QON
//
//  Created by Harshit Singh Kohli on 2024-11-21.
//

import Foundation
import SwiftUI

extension Text {
    func title() -> some View {
        self .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.white)
    }
}
