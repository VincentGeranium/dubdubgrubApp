//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/26.
//

import Foundation
import SwiftUI
import UIKit

struct AvatarView: View {
    
    var size: CGFloat
    
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(size: 90, image: PlaceholderImageManager.defaultAvatar)
    }
}
