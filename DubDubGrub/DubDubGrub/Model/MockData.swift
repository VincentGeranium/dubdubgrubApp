//
//  MockData.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/27.
//

import Foundation
import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: "DDGLocation")
        record[DDGLocation.kName] = "다울 하우스"
        record[DDGLocation.kAddress] = "서울특별시 성동구 송정4가길 47"
        record[DDGLocation.kDescription] = "This is test description. how long to make it to test the 3 lines. anyway this is iOS engineer Vincent's house..."
        record[DDGLocation.kWebsiteURL] = "https://morgan-kang.notion.site/NSDiffableDataSourceSnapshot-a0644b6a95b74df09f00833a7e66b0d5"
        record[DDGLocation.kLocation] = CLLocation(latitude: 37.551022, longitude: 127.066255)
        record[DDGLocation.kPhoneNumber] = "82-10-3952-2228"
        
        return record
    }
}
