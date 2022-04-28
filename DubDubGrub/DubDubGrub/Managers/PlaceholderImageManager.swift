//
//  PlaceholderImageManager.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import UIKit

enum PlaceholderImageManager {
    static let defaultAvatar = UIImage(named: "default-avatar")
    static let defaultSquareAsset = UIImage(named: "default-square-asset")
    static let dafaultBannerAsset = UIImage(named: "default-banner-asset")
}

enum ImageDimension {
    case square, banner
    
    static func getPlaceholder(for dimension: ImageDimension) -> UIImage {
        guard let defaultSquareAsset = PlaceholderImageManager.dafaultBannerAsset else {
            fatalError()
        }
        
        guard let defaultBannerAsset = PlaceholderImageManager.dafaultBannerAsset else {
            fatalError()
        }
        
        switch dimension {
        case .square:
            return defaultSquareAsset
        case .banner:
            return defaultBannerAsset
        }
    }
}
