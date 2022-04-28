//
//  AlertView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/27.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: - MapView error
    static let unableToGetLocation = AlertItem(title: Text("Locations Error."),
                                               message: Text("Unable to retrieve location at this time.\nPlease try again."),
                                               dismissButton: .default(Text("OK")))
    
    static let locationRestricted = AlertItem(title: Text("Locations Restricted."),
                                               message: Text("You location is restricted. This may be due to parental controls."),
                                               dismissButton: .default(Text("OK")))
    
    static let locationDenied = AlertItem(title: Text("Locations Denied."),
                                               message: Text("Dub Dub Grub dose not have permission to access your location. To change that go to your phone's Setting > Dub Dub Grub > Location."),
                                               dismissButton: .default(Text("OK")))
    
    static let locationDisabled = AlertItem(title: Text("Locations Sevice Disabled."),
                                               message: Text("Your phone's location service are disabled. To change that go to your phone's Setting > Privacy > Location Sevices."),
                                               dismissButton: .default(Text("OK")))
}
