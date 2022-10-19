//
//  NewsResponse.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article {
    static var dummyData: Article {
        .init(author: "Jordan Palmer",
              url: "https://www.tomsguide.com/news/live/samsung-unpacked-august-2022",
              source: "Tom's Guide",
              title: "Samsung Unpacked event recap: Galaxy Z Fold 4, Galaxy Z Flip 4, Galaxy Watch 5 and more - Tom's Guide",
              articleDescription: "Everything Samsung announced at Unpacked",
              image: "https://cdn.mos.cms.futurecdn.net/5VzFz8Tk8riNiPLmqFBmc4-1200-80.jpg",
              date: Date())
    }
}
