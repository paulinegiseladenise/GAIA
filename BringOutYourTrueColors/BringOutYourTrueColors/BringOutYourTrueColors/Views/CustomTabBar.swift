//
//  CustomTabBar.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-03-22.
//

import SwiftUI

enum Tab: Int {
    case house, book, lightbulb, questionmark, colors
}

struct CustomTabBar: View {
    
    @State var selectedTab = Tab.house
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Hem")
                }
                .tag(Tab.house)
            
            TestView()
                .tabItem {
                    Image(systemName: "questionmark")
                    Text("Färgtest")
                }
                .tag(Tab.questionmark)
            
            ColorArraysView(isColorblindMode: false, viewModelArrays: ViewModelArrays())
                .tabItem {
                    if selectedTab == .colors {
                        Image("Rainbow")
                    } else {
                        Image("Gray")
                    }
                    Text("Färger")
                }
                .tag(Tab.colors)
        }
        .accentColor(Color.black)
    }
}
