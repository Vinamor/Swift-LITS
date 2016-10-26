import UIKit


class NotebookRecord {
    let date: Date
    var name: String?
    var text: String?
    var tags: Set<String>?
    /*
    var tag1: String?
    var tag2: String?
    var tag3: String?
    */
    
    init(date: Date, name: String?, text: String?, tags: Set<String>?) {
        self.date = date
        self.name = name
        self.text = text
        self.tags = tags
        
        /*
        self.tag1 = tag1
        self.tag2 = tag2
        self.tag3 = tag3
        */
    }
    
    func fullDescriotion() -> String {
        return "\(date)  \n  \(name!)  \n   \(tags!)  \n  \(text!)"
    }
}

let date = Date()

var obj = NotebookRecord(date: date, name: "Monday", text: "I'm very tired", tags: ["xc", "xx", "ss"])

obj.fullDescriotion()