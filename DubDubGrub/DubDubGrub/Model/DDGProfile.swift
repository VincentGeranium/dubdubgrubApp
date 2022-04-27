//
//  DDGProfile.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/27.
//

import Foundation
import CloudKit

struct DDGProfile {
    static let kAvatar: String = "avatar"
    static let kBio: String = "bio"
    static let kCompanyName: String = "companyName"
    static let kFirstName: String = "firstName"
    static let kIsCheckedIn: String = "isCheckedIn"
    static let kLastName: String = "lastName"
    
    let ckRecordID: CKRecord.ID
    let avatar: CKAsset!
    let bio: String
    let companyName: String
    let firstName: String
    let isCheckedIn: CKRecord.Reference? = nil
    let lastName: String
    
    init(record: CKRecord) {
        self.ckRecordID = record.recordID
        self.avatar = record[DDGProfile.kAvatar] as? CKAsset
        self.bio = record[DDGProfile.kBio] as? String ?? "N/A"
        self.companyName = record[DDGProfile.kCompanyName] as? String ?? "N/A"
        self.firstName = record[DDGProfile.kFirstName] as? String ?? "N/A"
        self.lastName = record[DDGProfile.kLastName] as? String ?? "N/A"
    }
}
