//
//  KallaxDrawerView.swift
//  inventory
//
//  Created by Milind Contractor on 29/6/24.
//

import SwiftUI
import SFSymbolsPicker

struct AddObjectView2: View {
    @ObservedObject var savedDataManager: SavedDataManager
    @State var objectToAdd: String = "Some object"
    @State var drawer: Int = 1
    @State var description: String = "Some description"
    @State var sfIcon: String = "text.book.closed.fill"
    @State var showChanger = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            Form {
                TextField("Object", text: $objectToAdd)
                Stepper(value: $drawer, in: 1...2) {
                    Text("Drawer: \(drawer)")
                }
                HStack {
                    Text("Icon selected:")
                    Spacer()
                    Button {
                        showChanger = true
                    } label: {
                        Image(systemName: sfIcon)
                    }
                    .buttonStyle(.bordered)
                }
                TextField("Description", text: $description)
                Button {
                    savedDataManager.savedDatas[0].kallaxDrawers.append(Object(name: objectToAdd, location: .alex(location: .left(number: drawer)), description: description, drawer: drawer))
                    dismiss()
                } label: {
                    Label("Add item", systemImage: "plus")
                }
                Button(role: .destructive) {
                    dismiss()
                } label: {
                    Label("Cancel", systemImage: "xmark.circle")
                }
            }
            .sheet(isPresented: $showChanger) {
                SymbolsPicker(selection: $sfIcon, title: "Select an icon", autoDismiss: true)
            }
            .navigationTitle("Add Object")
        }
    }
}

struct KallaxDrawerView: View {
    @ObservedObject var savedDataManager: SavedDataManager
    let testData = [Object(name: "Science Compilation", location: .alex(location: .left(number: 1)), description: "Physics O Level Compilation for the last 10 years of yap", sfIcon: "book.pages", drawer: 3)]
    @State var addObject = false
    
    @State var showChanger = false
    
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
                ForEach($savedDataManager.savedDatas[0].kallaxDrawers, id: \.id) { $object in
                    NavigationLink {
                        Form {
                            TextField("Object", text: $object.name)
                            TextField("Description", text: $object.description)
                            
                            Stepper(value: $object.drawer, in: 1...2) {
                                Text("Drawer: \(object.drawer)")
                            }
                            
                            
                            HStack {
                                Text("Icon selected:")
                                Spacer()
                                Button {
                                    showChanger = true
                                } label: {
                                    Image(systemName: object.sfIcon)
                                }
                                .buttonStyle(.bordered)
                            }
                            .sheet(isPresented: $showChanger) {
                                SymbolsPicker(selection: $object.sfIcon, title: "Select an icon", autoDismiss: true)
                            }
                            
                            Button {
                                savedDataManager.savedDatas[0].delete(id: object.id, list: .kallaxDrawer)
                            } label: {
                                Image(systemName: "trash")
                                Text("Delete")
                            }
                        }
                    } label: {
                        navigationLinkLabel(object: object)
                    }
                }
            }
            .navigationTitle(Text("Kallax Shelves"))
            .toolbar {
                Button {
                    addObject = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .fullScreenCover(isPresented: $addObject) {
                AddObjectView2(savedDataManager: savedDataManager)
            }
        }
    }
}
