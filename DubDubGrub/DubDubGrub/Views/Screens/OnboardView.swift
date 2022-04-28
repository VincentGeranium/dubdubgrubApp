//
//  OnboardView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import SwiftUI
import UIKit

struct OnboardView: View {
    var body: some View {
        //MARK: - Main Structure
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    XDismissButton()
                }

            }
            Spacer()
            // first element of VStack
            LogoView(frameWidth: 250)
                .padding(.bottom)
            
            VStack(alignment: .leading, spacing: 32) {
                OnboardInfoView(
                    imageName: "building.2.crop.circle",
                    title: "Restaurant Locations.",
                    description: "Find place to dine around the convention center."
                )
                
                OnboardInfoView(
                    imageName: "checkmark.circle",
                    title: "Check In.",
                    description: "Let other iOS Devs know where you are."
                )
                
                OnboardInfoView(
                    imageName: "person.2.circle",
                    title: "Find Friends.",
                    description: "See where other iOS Devs are and join the party."
                )
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

struct OnboardInfoView: View {
    
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(spacing: 26) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.brandPrimary)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title).bold()
                Text(description)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
            }
        }
    }
}

struct OnboardView_Previewer: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
