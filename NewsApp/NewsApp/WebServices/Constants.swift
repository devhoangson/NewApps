//
//  Constants.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

typealias AnyCompletionBlock = (_ result: Any?, _ error: Error?) -> Void
typealias ErrorCompletionBlock = (_ error: Error?) -> Void
typealias VoidCompletionBlock = () -> Void

let ApiKey = "25fc179436424a17a23ad1ea3bf1da2a"

enum Server: String {
    case ProductServer = "https://newsapi.org/v2/" 
    case DeveloperServer = "https://newsapi.org/"
}

enum API: String {
    case HeadLines = "top-headlines?country=us"
    case Everything = "everything?"
    
    static func headLinesURL() -> URL {
        let urlString = Server.ProductServer.rawValue + API.HeadLines.rawValue + "&apiKey=\(ApiKey)"
        return urlString.url
    }
    
    static func everythingURL(_ querry: String) -> URL {
        let urlString = Server.ProductServer.rawValue + API.Everything.rawValue + "apiKey=\(ApiKey)" + "&q=\(querry)"
        return urlString.url
    }
}
