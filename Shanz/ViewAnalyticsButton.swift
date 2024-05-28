//
//  ViewAnalyticsButton.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//

import Foundation
import SwiftUI

struct ViewAnalyticsButton: View {
    var body: some View {
        Button("View Analytics") {
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .foregroundColor(.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}
