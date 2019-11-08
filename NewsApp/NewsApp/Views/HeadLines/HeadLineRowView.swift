//
//  HeadLineRowView.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI
import RemoteImage


struct HeadLineRowSetting {
    static let kImageSize = CGSize(width: 80, height: 80)
    static let kLineLimitTitle = 1
    static let kLineLimitDecription = 2
}

struct HeadLineRowView: View {
    private var newsModel: NewsModel!
    
    init(_ model: NewsModel?) {
        self.newsModel = model
    }
    
    var body: some View {
        HStack {
            RemoteImage(url: self.newsModel.fullURL, errorView: { error in
                Text(error.localizedDescription)
            }, imageView: { image in
                image
                    .resizable()
                    .frame(width: HeadLineRowSetting.kImageSize.width, height: HeadLineRowSetting.kImageSize.height)
                    .aspectRatio(contentMode: .fit)
            }, loadingView: {
                Text(LocalizedStringKey("request_status"))
            }).padding(10)
            VStack (alignment: .leading, spacing: 5) {
                Text(self.newsModel.title ?? "")
                    .lineLimit(HeadLineRowSetting.kLineLimitTitle)
                    .font(.headline)
                Text(self.newsModel.description ?? "")
                    .lineLimit(HeadLineRowSetting.kLineLimitDecription)
                    .font(.caption)
            }
        }
    }
}

struct HeadLineRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeadLineRowView(nil)
    }
}
