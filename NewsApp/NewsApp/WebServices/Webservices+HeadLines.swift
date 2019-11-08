//
//  Webservices+HeadLines.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

extension WebServices {
    func topHeadLines(completion: AnyCompletionBlock?) {
        self.fetchData(atURL: API.headLinesURL()) { (articles: Articles?) in
            completion?(articles, nil)
        }
    }
    
    func filterByKey(_ key: String, completion: AnyCompletionBlock?) {
        self.fetchData(atURL: API.everythingURL(key)) { (articles: Articles?) in
            completion?(articles, nil)
        }
    }
}
