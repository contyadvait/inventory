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
            Text("Alex Drawer 1 (L)").tabItem { Label("Alex", systemImage: "left.circle") }.tag(2)
            Text("Kallax Drawers").tabItem { Label("Kallax", systemImage: "rectangle.grid.1x2") }.tag(4)
            
            HomeView(tabSelected: $selectedTab).tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(1)
            
            Text("Kallax Shelves").tabItem { Label("Kallax", systemImage: "square.grid.2x2.fill") }.tag(5)
            Text("Alex Drawer 2 (R}").tabItem { Label("Alex", systemImage: "right.circle") }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
