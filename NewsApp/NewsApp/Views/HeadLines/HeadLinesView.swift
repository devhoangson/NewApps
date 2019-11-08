//
//  HeadLinesView.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI

struct HeadLinesView: View {
    @ObservedObject private var viewModel = HeadLinesViewModel()
    
    init(_ viewModel: HeadLinesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(self.viewModel.isRequesting)) {
            NavigationView {
                VStack {
                    List {
                        ForEach(self.viewModel.news, id: \.id) { newModel in
                            NavigationLink(destination: HeadLineDetailView(newModel)) {
                                HeadLineRowView(newModel)
                            }
                        }
                    }
                    .navigationBarTitle(LocalizedStringKey("tab_headlines_title"))
                }.onAppear(perform:{
                    self.viewModel.topHeadLines()
                })
            }
        }
    }
}

struct HeadLinesView_Previews: PreviewProvider {
    static var previews: some View {
        HeadLinesView(HeadLinesViewModel())
    }
}
