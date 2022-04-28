//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
