//
//  CloudKitManager.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/27.
//

import Foundation
import CloudKit

struct CloudKitManager {
    static func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
        // ascending == true 일 경우, 오름차순으로 sort, false일 경우 reverse
        let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        
        // predicate == true 일 경우, recodType 또한 맞는 query를 찾아 그 안에 있는 모든 정보 즉 succes case의 모든 데이터를 준다는 것을 의미.
        let query = CKQuery(recordType: RecordTypeManager.location, predicate: NSPredicate(value: true))
        
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            
            
            guard error == nil else {
                guard let error = error else { return }
                completed(.failure(error))
                return
            }
            
            guard let records = records else { return }
            
            let locations = records.map { record in
                return record.convertToDDGLocation()
            }
            
            completed(.success(locations))

        }
        
    }
}

