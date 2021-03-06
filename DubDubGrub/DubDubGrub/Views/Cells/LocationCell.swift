//
//  LocationCell.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/26.
//

import SwiftUI

struct LocationCell: View {
    
    var location: DDGLocation
    
    var body: some View {
        HStack {
            Image(uiImage: location.createSquareImage())
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.vertical, 8)
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .frame(width:200, alignment: .leading)
//                    .background(Color.red)
                    
                HStack() {
                    AvatarView(size: 35, image: PlaceholderImageManager.defaultAvatar)
                    AvatarView(size: 35, image: PlaceholderImageManager.defaultAvatar)
                    AvatarView(size: 35, image: PlaceholderImageManager.defaultAvatar)
                    AvatarView(size: 35, image: PlaceholderImageManager.defaultAvatar)
                    AvatarView(size: 35, image: PlaceholderImageManager.defaultAvatar)
                }
            }
            .padding(.leading)
        }
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(location: DDGLocation(record: MockData.location))
    }
}
