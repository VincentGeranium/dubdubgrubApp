//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/23.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(locationManager)
        }
    }
}
