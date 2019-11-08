//
//  HeadLineDetailView.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI
import RemoteImage

struct HeadLineDetailView: View {
    @State private var showingWebURL = false
    
    private var newsModel: NewsModel!
    init(_ model: NewsModel?) {
        self.newsModel = model
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(self.newsModel.title ?? "")
                    .font(.headline)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: -15, trailing: 20))
                RemoteImage(url: self.newsModel.fullURL, errorView: { error in
                    Text(error.localizedDescription)
                }, imageView: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, loadingView: {
                    Text(LocalizedStringKey("request_status"))
                }).padding(20)
                Text(self.newsModel.description ?? "")
                    .padding(EdgeInsets(top: -15, leading: 20, bottom: 20, trailing: 20))
                    .font(.caption)
                Text(self.newsModel.content ?? "")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    .font(.body)
                    .navigationBarItems(trailing:
                        Button(LocalizedStringKey("full_content_url_link")) {
                            self.showingWebURL = true
                        }
                ).sheet(isPresented: self.$showingWebURL, content: {
                    return WebView(self.newsModel.url ?? "")
                })
            }
        }.padding(.top, -20)
    }
}

struct HeadLineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeadLineDetailView(nil)
    }
}
