//
//  LinkView.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//

import Foundation
import SwiftUI

struct LinkView: View {
    let link: Link

    var body: some View {
        HStack(spacing: 15) {
            if let thumbnail = link.originalImage, let url = URL(string: thumbnail) {
                AsyncImage(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image(systemName: "link.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .background(Color.orange.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(link.title)
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .truncationMode(.tail)
                    .lineLimit(1)

                Text(link.webLink)
                    .foregroundColor(.blue)
                    .lineLimit(1)
                    .font(.system(size: 12))
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text("\(link.totalClicks) Clicks")
                    .foregroundColor(.black)
                    .font(.system(size: 12))

                Text("Created at: \(formattedDate(link.createdAt))")
                    .foregroundColor(.black)
                    .font(.system(size: 10))
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(height: 50)
        .background(Color.orange)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
        .padding(.horizontal)
    }

    
    private func formattedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" 
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "dd MMM yyyy"
            return formatter.string(from: date)
        }
        return "Unknown Date"
    }
}
