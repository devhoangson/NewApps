//
//  NewsModel.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

struct Articles: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsModel]
}

struct NewsModel: Codable {
    let id = UUID()
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    
    var fullURL: URL {
        if let urlToImage = self.urlToImage {
            return urlToImage.url
        }
        return Server.DeveloperServer.rawValue.url
    }
}
