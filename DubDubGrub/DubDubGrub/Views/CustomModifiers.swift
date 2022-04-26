//
//  CustomModifiers.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/26.
//

import SwiftUI

struct ProfileNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32, weight: .bold))
            .lineLimit(1)
            .minimumScaleFactor(0.75)
    }
}

struct BioEditStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 100)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondary, lineWidth: 1))
    }
}
