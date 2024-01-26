//
//  NewsModel.swift
//  NewsApp
//
//  Created by apple on 26/01/24.
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    var status: String?
    var totalResults: Int?
    var results: [NewsResult]?
    var nextPage: String?
}

// MARK: - Result
struct NewsResult: Codable {
    var articleID, title: String?
    var link: String?
    var keywords, creator: [String]?
    var videoURL: String?
    var description: String?
    var content: String?
    var pubDate: String?
    var imageURL: String?
    var sourceID: String?
    var sourceURL: String?
    var sourcePriority: Int?
    var country, category: [String]?
    var language: String?
    var aiTag, sentiment, sentimentStats: String?
    var aiRegion: String?
    
    enum CodingKeys: String, CodingKey {
            case articleID = "article_id"
            case title, link, keywords, creator
            case videoURL = "video_url"
            case description, content, pubDate
            case imageURL = "image_url"
            case sourceID = "source_id"
            case sourceURL = "source_url"
            case sourcePriority = "source_priority"
            case country, category, language
            case aiTag = "ai_tag"
            case sentiment
            case sentimentStats = "sentiment_stats"
            case aiRegion = "ai_region"
        }
}
