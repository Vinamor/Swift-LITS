
import UIKit
import Foundation

class NotebookRecord {
    let date: Date
    var name: String?
    var text: String?
    var tags: Set<String>?
    
    init(name: String? = nil, text: String? = nil, tags: Set<String>? = nil) {
        self.date = Date()
        self.name = name
        self.text = text
        self.tags = tags
    }
    
    
    func fullDescriotion() -> String {
        var str = ""
        str += "\(self.date)"
        
        if let name = self.name {
            str += "\n" + name
        }
        
        if let tags = self.tags {
            str += "\n"
            for i in tags {
                str += " [\(i)] "
            }
        }
        
        if let text = self.text {
            str += "\n \(text)"
        }
        
        return str
    }
}


//public func date(from components: DateComponents) -> Date?


//так чомусь не працює ?? не розумію в чому справа
//let date1 = Calendar.date(from: DateComponents(year: 2016, month: 10, day: 27))

//var y: Int? = 5
//var datee = Calendar.date(from: DateComponents(year: 2016, month: 10, day: 26))

//let date = Date()

let obj1 = NotebookRecord(name: "Wednesday", text: "Unfortunately, I'm tired", tags: ["#newstart", "#fun", "#letsdosomething"] )
let obj2 = NotebookRecord()
let obj3 = NotebookRecord(name: "Thursday")
let obj4 = NotebookRecord(text: "Here's no other fields except date")
let obj5 = NotebookRecord(name: "Friday", tags: ["#horrayFriday", "#therestisclose"] )
let obj6 = NotebookRecord(tags: ["#fun", "#enjoy your day"])
let obj7 = NotebookRecord(text: "Hi, everybody")


obj1.fullDescriotion()
obj2.fullDescriotion()
obj3.fullDescriotion()
obj4.fullDescriotion()
obj5.fullDescriotion()
obj6.fullDescriotion()
obj7.fullDescriotion()
