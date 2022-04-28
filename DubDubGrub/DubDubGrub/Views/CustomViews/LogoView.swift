//
//  LogoView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import SwiftUI
import UIKit

struct LogoView: View {
    var frameWidth: CGFloat
    
    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(frameWidth: 250)
    }
}
