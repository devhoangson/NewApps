//
//  FilterViewModel.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

class FilterViewModel: ObservableObject {
    static let filters = [
        FilterModel(name: NSLocalizedString("filter_apple_title", comment: ""), index: 0),
        FilterModel(name: NSLocalizedString("filter_bitcoin_title", comment: ""), index: 1),
        FilterModel(name: NSLocalizedString("filter_earthquake_title", comment: ""), index: 2),
        FilterModel(name: NSLocalizedString("filter_animal_title", comment: ""), index: 3)
    ]
    
    @Published private(set) var selectedFilter: Int = 0
    @Published private(set) var news: [NewsModel] = [NewsModel]()
    @Published private(set) var isRequesting: Bool = true

    func filterByKeyword(_ filter: FilterModel, completion: AnyCompletionBlock? = nil) {
        self.selectedFilter = filter.index
        self.isRequesting = true
        WebServices.shared.filterByKey(filter.name.lowercased()) { [weak self] (data, error) in
            if let data = data as? Articles {
                self?.isRequesting = false
                self?.news = data.articles
            }
        }
    }
}
