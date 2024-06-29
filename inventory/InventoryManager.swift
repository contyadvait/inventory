import Foundation
import SwiftUI

class SavedDataManager: ObservableObject {
    @Published var savedDatas: [SavedData] = [SavedData(kallaxDrawers: [Object(name: "Cables", location: .kallax(location: .shelf(number: 1)), description: "All the cables", sfIcon: "cable.coaxial", drawer: 1)], kallaxShelf: [], alexLeft: [Object(name: "Pens", location: .alex(location: .left(number: 1)), description: "All pens, pencils, etc.", drawer: 1)], alexRight: [])] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "savedDatas.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedSavedDatas = try? propertyListEncoder.encode(savedDatas)
        try? encodedSavedDatas?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedSavedDataData = try? Data(contentsOf: archiveURL),
            let savedDatasDecoded = try? propertyListDecoder.decode([SavedData].self, from: retrievedSavedDataData) {
            savedDatas = savedDatasDecoded
        }
    }
}
