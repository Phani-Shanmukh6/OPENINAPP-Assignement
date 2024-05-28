//
//  QuickStatView.swift
//  Shanz
//
//  Created by Phani shanmukh on 28/05/24.
//

import Foundation

import SwiftUI

struct QuickStatView: View {
    var stat: String
    var label: String
    var icon: String
    
    var dashboardData: DashboardData?
    
    var body: some View {
        VStack {
            HStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34, height: 34)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(stat)
                .font(.headline)
            Text(label)
                .font(.subheadline)
        }
        .padding()
        .background(Color.pink)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
}
