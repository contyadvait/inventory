//
//  InventoryObjects.swift
//  inventory
//
//  Created by Milind Contractor on 28/6/24.
//

import Foundation

enum Kallax: Codable {
    case shelf(number: Int)
    case drawer(number: Int)
    
    var number: String {
        return "\(self.number)"
    }
}

enum Alex: Codable {
    case left(number: Int)
    case right(number: Int)
    
    var number: String {
        return "\(self.number)"
    }
}

enum Shelf: Codable {
    case kallax(location: Kallax)
    case alex(location: Alex)
}

struct Object: Identifiable, Codable {
    let id = UUID()
    
    var name: String
    var location: Shelf
    var description: String
    var sfIcon: String = "book.pages"
    var drawer: Int = 1
}

struct SavedData: Identifiable, Codable {
    let id = UUID()
    
    var kallaxDrawers: [Object]
    var kallaxShelf: [Object]
    var alexLeft: [Object]
    var alexRight: [Object]
    
}
