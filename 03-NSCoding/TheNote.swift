//
//  TheNote.swift
//  Notebook
//
//  Created by Marta Romaniv on 30.10.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit
class TheNote: NSObject, NSCoding {
    let date: Date
    var name: String?
    var text: String?
    var weather: Int?
//var tags: Set<String>?
    
    // MARK: Archiving Paths
    // open func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL]

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("notes")
    
    // MARK: Types
    
    struct PropertyKey {
        static let dateKey = "date"
        static let nameKey = "name"
        static let textKey = "text"
        static let weatherKey = "weather"
    }

    init(date: Date, name: String? = nil, text: String? = nil, weather: Int? = nil) {
        self.date = date
        self.name = name
        self.text = text
        self.weather = weather
      
        super.init()
        
    //self.tags = tags
}


func fullDescriotion() -> String {
    var str = ""
    str += "\(self.date)"
    
    if let name = self.name {
        str += "\n" + name
    }
    
    /*
    if let tags = self.tags {
        str += "\n"
        for i in tags {
            str += " [\(i)] "
        }
    }
    */
    if let text = self.text {
        str += "\n \(text)"
    }
    
    return str
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: PropertyKey.dateKey)
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(text, forKey: PropertyKey.textKey)
        aCoder.encode(weather, forKey: PropertyKey.weatherKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let date = aDecoder.decodeObject(forKey: PropertyKey.dateKey) as! Date
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as? String
        let text = aDecoder.decodeObject(forKey: PropertyKey.textKey) as? String
        let weather = aDecoder.decodeObject(forKey: PropertyKey.weatherKey) as? Int
        
        self.init(date: date, name: name, text: text, weather: weather)
       
            
    }
    
}
