//
//  TabView.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        
        TabView {
            
            BaseScreen(
                page: .previewMoviews,
                titleTabBar: R.Strings.titleMovie,
                iconTabBar: R.Icons.iconMovie
            )
            
            BaseScreen(
                page: .previewSerials,
                titleTabBar: R.Strings.titleSerial,
                iconTabBar: R.Icons.iconSerial
            )
            
            BaseScreen(
                page: .random,
                titleTabBar: R.Strings.titleRandom,
                iconTabBar: R.Icons.iconRandom
            )
            
            BaseScreen(
                page: .favorites,
                titleTabBar: R.Strings.titleFavorite,
                iconTabBar: R.Icons.iconFavorite
            )
        }
        .tint(Color("activeTabBtn"))
        .environmentObject(coordinator)
        
    }
    
}


struct BaseScreen: View {
    
    @EnvironmentObject  var coordinator: Coordinator
    
    var page: Page
    var titleTabBar: Text
    var iconTabBar: Image
    
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: page)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        
        .tabItem {
            Label {
                titleTabBar
            } icon: {
                iconTabBar
            }
            
        }
    }
}
