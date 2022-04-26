//
//  MainTabView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/24.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.secondaryLabel
    }
    var body: some View {
        TabView {
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
