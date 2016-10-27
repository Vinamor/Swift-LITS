
import UIKit
import Foundation


class NotebookRecord {
    let date: Date
    var name: String?
    var text: String?
    var tags: Set<String>?
    


    init(date: Date) {
        self.date = date
    }
    
    init(date: Date, name: String?, text: String?, tags: Set<String>?) {
        self.date = date
        self.name = name
        self.text = text
        self.tags = tags
    }
    
    
    func fullDescriotion() -> String {
         let name = self.name ?? ""
         let tags = self.tags ?? Set<String>()
         let text = self.text  ?? ""
        
        return "\(date) \n \(name) \n \(tags) \n  \(text)"
    }
}

//так чомусь не працює ?? не розумію в чому справа
//let date = Calendar.date(from: DateComponents(year: 2016, month: 10, day: 27))

let date = Date()

let obj1 = NotebookRecord(date: date, name: "Wednesday", text: "But, unfortunately, I'm very tired", tags: ["#newstart", "#fun", "#letsdosomething"] )
let obj2 = NotebookRecord(date: date, name: nil, text: nil, tags: nil)
let obj3 = NotebookRecord(date: date, name: "Thursday", text: nil, tags: nil)
let obj4 = NotebookRecord(date: date, name: nil, text: "Here's no other fields except date", tags: nil)
let obj5 = NotebookRecord(date: date)



obj1.fullDescriotion()
obj2.fullDescriotion()
obj3.fullDescriotion()
obj4.fullDescriotion()
obj5.fullDescriotion()
