
import UIKit
import Foundation


class NotebookRecord {
    let date: Date
    var name: String?
    var text: String?
    var tags: Set<String>?
    
    init(date: Date, name: String? = nil, text: String? = nil, tags: Set<String>? = nil) {
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

//let d = Calendar.date(from: DateComponents(year: 2016)
let date = Date()

let obj1 = NotebookRecord(date: date, name: "Wednesday", text: "But, unfortunately, I'm very tired", tags: ["#newstart", "#fun", "#letsdosomething"] )
let obj2 = NotebookRecord(date: date)
let obj3 = NotebookRecord(date: date, name: "Thursday")
let obj4 = NotebookRecord(date: date, text: "Here's no other fields except date")
let obj5 = NotebookRecord(date: date, name: "Friday", tags: ["#horrayFriday", "#therestisclose"] )
let obj6 = NotebookRecord(date: date, tags: ["#fun", "#enjoy your day"])
let obj7 = NotebookRecord(date: date, text: "Hi, everybody")


obj1.fullDescriotion()
obj2.fullDescriotion()
obj3.fullDescriotion()
obj4.fullDescriotion()
obj5.fullDescriotion()
obj6.fullDescriotion()
obj7.fullDescriotion()
