//
//  FilterView.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI

struct FilterByKeywordView: View {
    @State private var showActionSheet: Bool = false
    
    private var filters: [FilterModel]!
    private var selectedIndex: Int = 0
    private var didSelectedValue: AnyCompletionBlock?
    
    init(_ filters: [FilterModel], _ selectedIndex: Int = 0, _ block: AnyCompletionBlock?) {
        self.filters = filters
        self.selectedIndex = selectedIndex
        self.didSelectedValue = block
    }
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey("filter_by"))
            VStack {
                Button(action: {
                    self.showActionSheet = true
                }, label: {
                    HStack {
                        Text(self.filters[self.selectedIndex].name)
                        Text("^")
                            .rotationEffect(Angle(degrees: 180.0))
                            .padding(.leading, CGFloat(-5))
                    }
                }).actionSheet(isPresented: self.$showActionSheet) {
                    ActionSheet(title: Text(LocalizedStringKey("filter_description")),
                                message: nil,
                                buttons: [
                                    .cancel(),
                                    .default(Text(LocalizedStringKey("filter_apple_title")), action: {
                                        self.didSelectedValue?(self.filters[0], nil)
                                    }),
                                    .default(Text(LocalizedStringKey("filter_bitcoin_title")), action: {
                                        self.didSelectedValue?(self.filters[1], nil)
                                    }),
                                    .default(Text(LocalizedStringKey("filter_earthquake_title")), action: {
                                        self.didSelectedValue?(self.filters[2], nil)
                                    }),
                                    .default(Text(LocalizedStringKey("filter_animal_title")), action: {
                                        self.didSelectedValue?(self.filters[3], nil)
                                    })
                    ])
                }
            }
        }
    }
}

struct FilterView: View {
    @ObservedObject private var viewModel = FilterViewModel()
    
    init(_ viewModel: FilterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(self.viewModel.isRequesting)) {
            NavigationView {
                VStack {
                    FilterByKeywordView(FilterViewModel.filters, self.viewModel.selectedFilter) { (filter, error) in
                        self.viewModel.filterByKeyword(filter as! FilterModel)
                    }
                    List {
                        ForEach(self.viewModel.news, id: \.url) { model in
                            NavigationLink(destination: HeadLineDetailView(model)) {
                                HeadLineRowView(model)
                            }
                        }
                    }
                    .navigationBarTitle(LocalizedStringKey("tab_filters_title"))
                }.onAppear(perform:{
                    self.viewModel.filterByKeyword(FilterViewModel.filters[0])
                })
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(FilterViewModel())
    }
}
