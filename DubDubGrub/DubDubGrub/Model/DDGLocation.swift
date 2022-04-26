//
//  DDGLocation.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/26.
//

import Foundation
import CloudKit

struct DDGLocation {
    static let kName: String = "name"
    static let kDescription: String = "description"
    static let kSquareAsset: String = "squareAsset"
    static let kBannerAsset: String = "bannerAsset"
    static let kAddress: String = "address"
    static let kLocation: String = "location"
    static let kWebsiteURL: String = "websiteURL"
    static let kPhoneNumber: String = "phoneNumber"
    
    let ckRecordID: CKRecord.ID
    let address: String
    let bannerAsset: CKAsset!
    let description: String
    let location: CLLocation
    let name: String
    let phoneNumber: String
    let squareAsset: CKAsset!
    let websiteURL: String
    
    init(record: CKRecord) {
        self.ckRecordID = record.recordID
        self.name = record[DDGLocation.kName] as? String ?? "N/A"
        self.description = record[DDGLocation.kDescription] as? String ?? "N/A"
        self.squareAsset = record[DDGLocation.kSquareAsset] as? CKAsset
        self.bannerAsset = record[DDGLocation.kBannerAsset] as? CKAsset
        self.address = record[DDGLocation.kAddress] as? String ?? "N/A"
        self.location = record[DDGLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        self.websiteURL = record[DDGLocation.kWebsiteURL] as? String ?? "N/A"
        self.phoneNumber = record[DDGLocation.kPhoneNumber] as? String ?? "N/A"
    }
}
