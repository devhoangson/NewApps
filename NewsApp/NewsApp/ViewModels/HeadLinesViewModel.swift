//
//  HeadLinesViewModel.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

class HeadLinesViewModel: ObservableObject {
    @Published private(set) var news = [NewsModel]()
    @Published private(set) var isRequesting: Bool = true

    func topHeadLines() {
        if self.news.count > 0 { return }
        WebServices.shared.topHeadLines { [weak self] (data, error) in
            if let data = data as? Articles {
                self?.isRequesting = false
                self?.news = data.articles
            }
        }
    }
}
