//
//  LeftAlexView.swift
//  inventory
//
//  Created by Milind Contractor on 29/6/24.
//

import SwiftUI

struct LeftAlexView: View {
    //    @ObservedObject var savedDataManager: SavedDataManager
    let testData = [Object(name: "Science Compilation", location: .alex(location: .left(number: 1)), description: "Physics O Level Compilation for the last 10 years of yap", sfIcon: "book.pages", drawer: 3)]
    
    func navigationLinkLabel(object: Object) -> some View {
        HStack {
            VStack {
                HStack {
                    Image(systemName: object.sfIcon)
                        .font(.headline)
                    Text(object.name)
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text(object.description)
                    Spacer()
                }
            }
            Divider()
            VStack {
                Text("DRAWER")
                    .fontWidth(.compressed)
                Text("\(object.drawer)")
                    .fontWidth(.expanded)
                    .font(.system(size: 40))
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(testData, id: \.id) { object in
                    NavigationLink {
                        Button {
                        
                        } label: {
                            VStack {
                                Image(systemName: "trash")
                                    .font(.system(size: 50))
                                Text("Delete")
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    } label: {
                        navigationLinkLabel(object: object)
                    }
                }
            }
            .navigationTitle(Text("Left Alex Drawer"))
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    LeftAlexView()
}
