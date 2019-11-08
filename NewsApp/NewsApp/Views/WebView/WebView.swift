//
//  WebView.swift
//  NewsApp
//
//  Created by son5c on 11/8/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private var url: String!
    
    init(_ url: String) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }

    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebView>) {
        let request = URLRequest(url: URL(string: self.url)!)
        view.load(request)
    }
}
