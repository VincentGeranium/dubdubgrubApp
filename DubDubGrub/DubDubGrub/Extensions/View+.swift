//
//  View+.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/26.
//

import SwiftUI

// MARK: - extension
extension View {
    func profileNameStyle() -> some View {
        return self.modifier(ProfileNameText())
    }
    
    func bioEditorStyle() -> some View {
        return self.modifier(BioEditStyle())
    }
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil
        )
    }
}
