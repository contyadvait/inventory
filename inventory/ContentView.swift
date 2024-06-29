//
//  ContentView.swift
//  inventory
//
//  Created by Milind Contractor on 28/6/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var savedDataManager = SavedDataManager()
    @State var selectedTab: Int = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            LeftAlexView(savedDataManager: savedDataManager).tabItem { Label("Alex", systemImage: "left.circle") }.tag(2)
            KallaxDrawerView(savedDataManager: savedDataManager).tabItem { Label("Kallax", systemImage: "rectangle.grid.1x2") }.tag(4)
            
            HomeView(tabSelected: $selectedTab).tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(1)
            
            KallaxShelfView(savedDataManager: savedDataManager).tabItem { Label("Kallax", systemImage: "square.grid.2x2.fill") }.tag(5)
            RightAlexView(savedDataManager: savedDataManager).tabItem { Label("Alex", systemImage: "right.circle") }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
