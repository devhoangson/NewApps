//
//  ContentView.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI

enum SelectedTab: Int {
    case HeadeLine = 0
    case Filter = 1
    case Profile = 2
}

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            HeadLinesView(HeadLinesViewModel()).tabItem {
                Image(systemName: "1.circle")
                Text(LocalizedStringKey("tab_headlines_title"))
            }.tag(0)
            FilterView(FilterViewModel()).tabItem({
                Image(systemName: "2.circle")
                Text(LocalizedStringKey("tab_filters_title"))
            }).tag(1)
            ProfileView(ProfileViewModel()).tabItem({
                Image(systemName: "3.circle")
                Text(LocalizedStringKey("tab_profile_title"))
            }).tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
