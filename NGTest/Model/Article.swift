//
//  ArticleDO.swift
//  NGTest
//

import Foundation

// MARK: - Article
struct Article: Codable {
    
    let id: String
    let channelName: String
    let title: String
    let publicationDate: Date
    let lead: String
    let visual: [Visual]
    
     enum CodingKeys: String, CodingKey {
        case id
        case channelName
        case title
        case lead
        case publicationDate
        case visual
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.channelName = try container.decode(String.self, forKey: .channelName)
        self.title = try container.decode(String.self, forKey: .title)
        self.lead = try container.decode(String.self, forKey: .lead)
        self.publicationDate = DateFormatter.formatArticle.date(from: try container.decode(String.self, forKey: .publicationDate)) ?? Date()
        self.visual = try container.decode([Article.Visual].self, forKey: .visual)
        if !self.channelName.isEmpty {
            ArticlesViewModel.channelNames.insert(self.channelName)
        }
    }
    
    // MARK: - Visual
    struct Visual: Codable {
        let id: String
        let urlPattern: String
        
         enum CodingKeys: String, CodingKey {
            case id
            case urlPattern
        }
    }   
}



