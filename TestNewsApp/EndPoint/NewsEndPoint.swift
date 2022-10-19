//
//  NewsEndPoint.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import Foundation

protocol ApiBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsApi {
    case getNews
}

extension NewsApi: ApiBuilder {
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
