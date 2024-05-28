//
//  ButtonStyleModifier.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//

import Foundation
import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    var isSelected: Bool

    func body(content: Content) -> some View {
        content
            .foregroundColor(isSelected ? .white : .gray)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(height: 40)
            .background(isSelected ? Color.purple : Color.clear) 
            .cornerRadius(20)
    }
}

