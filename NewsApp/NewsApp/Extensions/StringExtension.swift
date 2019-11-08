//
//  StringExtension.swift
//  NewsApp
//
//  Created by son5c on 11/8/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation

extension String {
    var url: URL {
        return URL(string: self)!
    }
}
