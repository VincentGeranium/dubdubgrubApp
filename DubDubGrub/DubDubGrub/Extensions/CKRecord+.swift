//
//  CKRecord+.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/27.
//

import Foundation
import CloudKit

extension CKRecord {
    func convertToDDGLocation() -> DDGLocation { return DDGLocation(record: self) }
    func convertToDDGProfile() -> DDGProfile { return DDGProfile(record: self) }
}
