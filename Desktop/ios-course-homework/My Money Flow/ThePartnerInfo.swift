//
//  ThePartnerInfo.swift
//  My Money Flow
//
//  Created by Marta Romaniv on 03.12.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class ThePartnerInfo: NSObject, NSCoding {
    let photo: UIImage?
    let name: String?
    let surname: String?
    let mobileNumber: String?
    let email: String?
    let currentBalance: Decimal?
    
    init(photo: UIImage? = nil,name: String? = nil, surname: String? = nil, mobileNumber: String? = nil, email: String? = nil, currentBalance: Decimal? = nil) {
        let currBal: TheReportNote? = TheReportNote()
        self.photo = photo
        self.name = name
        self.surname = surname
        self.mobileNumber = mobileNumber
        self.email = email
        self.currentBalance = currBal?.sum
        
        super.init()
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
    static let ArchieveURL = DocumentsDirectory?.appendingPathComponent("info")
    
    struct PropertyKey {
        static let photoKey = "photo"
        static let nameKey = "name"
        static let surnameKey = "surname"
        static let mobileNumberKey = "mobileNumber"
        static let emailKey = "email"
        static let currentBalanceKey = "currentBalance"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(PropertyKey.photoKey)
        aCoder.encode(PropertyKey.nameKey)
        aCoder.encode(PropertyKey.surnameKey)
        aCoder.encode(PropertyKey.mobileNumberKey)
        aCoder.encode(PropertyKey.emailKey)
        aCoder.encode(PropertyKey.currentBalanceKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as? String
        let surname = aDecoder.decodeObject(forKey: PropertyKey.surnameKey) as? String
        let mobileNumber = aDecoder.decodeObject(forKey: PropertyKey.mobileNumberKey) as? String
        let email = aDecoder.decodeObject(forKey: PropertyKey.emailKey) as? String
        let currentBalance = aDecoder.decodeObject(forKey: PropertyKey.currentBalanceKey) as? Decimal
        
        self.init(photo: photo, name: name, surname: surname, mobileNumber: mobileNumber, email: email, currentBalance: currentBalance)
    }
}
