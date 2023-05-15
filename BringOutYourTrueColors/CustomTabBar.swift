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
                    }
                    .tag(Tab.house)
                
                InfoView()
                    .tabItem {
                        Image(systemName: "book")
                    }
                    .tag(Tab.book)
                
                TestView()
                    .tabItem {
                        Image(systemName: "questionmark")
                    }
                    .tag(Tab.questionmark)
                
                ColorArraysView(viewModelArrays: ViewModelArrays())
                    .tabItem {
                        if selectedTab == .colors {
                            Image("Rainbow")
                        } else {
                            Image("Gray")
                        }
                    }
                    .tag(Tab.colors)
            }
            .accentColor(Color.black)
        }
    }


//nedan är exempel på ytterligare en vy....
//            ResultView()
//                .tabItem {
//                    Image(systemName: "lightbulb")
//                }
//                .tag(Tab.lightbulb)
