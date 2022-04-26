//
//  DDGButton.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/26.
//

import Foundation
import SwiftUI

struct DDGButton: View {
    var title: String
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .bold()
            .frame(width: 280, height: 44)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct DDGButton_Priviews: PreviewProvider {
    static var previews: some View {
        DDGButton(title: "Test Button", backgroundColor: Color.brandPrimary)
    }
}
