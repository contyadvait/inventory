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

enum ObjectEdit: Codable {
    case alexL, alexR, kallaxShelf, kallaxDrawer
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
    
    mutating func delete(id: UUID, list: ObjectEdit) {
        
        switch list {
        case .alexL:
            if let index = alexLeft.index(where: {$0.id == id})
            {
                alexLeft.remove(at: index)
            }
        case .alexR:
            if let index = alexRight.index(where: {$0.id == id})
            {
                alexRight.remove(at: index)
            }
        case .kallaxShelf:
            if let index = kallaxShelf.index(where: {$0.id == id})
            {
                kallaxShelf.remove(at: index)
            }
        case .kallaxDrawer:
            if let index = kallaxDrawers.index(where: {$0.id == id})
            {
                kallaxDrawers.remove(at: index)
            }
        }
    }
}
