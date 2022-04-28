//
//  XDismissButton.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import SwiftUI
import UIKit

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.brandPrimary)
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .imageScale(.small)
                .frame(width: 55, height: 55)
        }
    }
}

struct XDismissButton_Previes: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
