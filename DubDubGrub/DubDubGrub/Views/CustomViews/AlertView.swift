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
}
