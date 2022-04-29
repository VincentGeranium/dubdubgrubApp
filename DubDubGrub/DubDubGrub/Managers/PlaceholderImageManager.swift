//
//  PlaceholderImageManager.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import UIKit

enum PlaceholderImageManager {
    static var defaultAvatar: UIImage {
        guard let image = UIImage(named: "default-avatar") else {
            fatalError()
        }
        return image
    }
    
    static var defaultSquareAsset: UIImage {
        guard let image = UIImage(named: "default-square-asset") else {
            fatalError()
        }
        return image
    }
    
    static var defaultBannerAsset: UIImage {
        guard let image = UIImage(named: "default-banner-asset") else {
            fatalError()
        }
        return image
    }
}

enum ImageDimension {
    case square, banner
    
    static func getPlaceholder(for dimension: ImageDimension) -> UIImage {        
        switch dimension {
        case .square:
            return PlaceholderImageManager.defaultSquareAsset
        case .banner:
            return PlaceholderImageManager.defaultBannerAsset
        }
    }
}
