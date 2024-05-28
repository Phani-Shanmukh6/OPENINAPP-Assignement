//
//  DashboardData.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//

import Foundation

struct DashboardData: Codable {
    var status: Bool
    var statusCode: Int
    var message: String?
    var todayClicks: Int?
    var topSource: String?
    var topLocation: String?
    var data: DashboardDetails?

    enum CodingKeys: String, CodingKey {
        case status, statusCode, message, data
          case todayClicks = "today_clicks"
          case topSource = "top_source"
          case topLocation = "top_location"
    }
}

struct DashboardDetails: Codable {
    var recentLinks: [Link]
    var topLinks: [Link]
    var favouriteLinks: [Link]

    enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case favouriteLinks = "favourite_links"
    }
}

extension DashboardDetails {
    func getChartData() -> [ChartData] {
        recentLinks.map { link -> ChartData? in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            if let date = formatter.date(from: link.createdAt) {
                formatter.dateFormat = "MMM" 
                let month = formatter.string(from: date)
                return ChartData(month: month, value: Double(link.totalClicks))
            }
            return nil
        }
        .compactMap { $0 }
    }
}

struct Link: Codable {
    var urlId: Int
    var webLink: String
    var smartLink: String
    var title: String
    var totalClicks: Int
    var originalImage: String?
    var thumbnail: String?
    var timesAgo: String
    var createdAt: String
    var domainId: String
    var urlPrefix: String?
    var urlSuffix: String
    var app: String
    var isFavourite: Bool

    enum CodingKeys: String, CodingKey {
        case urlId = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title, totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail, timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainId = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app
        case isFavourite = "is_favourite"
    }
}
