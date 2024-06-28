//
//  HomeView.swift
//  inventory
//
//  Created by Milind Contractor on 28/6/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    let cornerRadius = 10.0
    @Binding var tabSelected: Int
    
    func mainButton(sfIcon: String, name: String, reset: Int) -> some View {
        Button {
            tabSelected = reset
        } label: {
            VStack {
                Image(systemName: sfIcon)
                    .foregroundStyle(.red)
                    .font(.system(size: 27))
                    .padding(3)
                Text(name)
                    .font(.system(size: 20))
            }
            .padding(10)
            .frame(width: (UIScreen.main.bounds.size.width - 30) / 2, height: 140)
            .background(colorScheme == .dark ? Color(red: 18/225, green: 18/225, blue: 18/225) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: colorScheme == .dark ? .white.opacity(0.01) : .black.opacity(0.1), radius: 15, x: 0, y: 5)
            .foregroundStyle(colorScheme == .dark ? .white : .black)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Room inventory manager")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                Spacer()
            }
            .padding()
            
            HStack {
                mainButton(sfIcon: "left.circle", name: "Left Alex Drawer", reset: 2)
                mainButton(sfIcon: "right.circle", name: "Right Alex Drawer", reset: 3)
            }
            HStack {
                mainButton(sfIcon: "rectangle.grid.1x2", name: "Kallax Drawers", reset: 4)
                mainButton(sfIcon: "squareshape.split.2x2", name: "Kallax Shelves", reset: 5)
            }
            
        }
    }
}

#Preview {
    HomeView(tabSelected: .constant(1))
}
