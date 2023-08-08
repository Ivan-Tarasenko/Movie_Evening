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
            
            
            
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: .previewMoviews)
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page: page)
                    }
                    .sheet(item: $coordinator.sheet) { sheet in
                        coordinator.build(sheet: sheet)
                    }
                    .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                        coordinator.build(fullScreenCover: fullScreenCover)
                    }
            }
            .environmentObject(coordinator)
            
            
            
            
            
            .tabItem {
                Label {
                    R.Strings.titleMovie
                } icon: {
                    R.Icons.iconMovie
                }
                
            }
            
            NavigationView {
                Serials()
            }
            .tabItem {
                Label {
                    R.Strings.titleSerial
                } icon: {
                    R.Icons.iconSerial
                }
            }
            
            NavigationView {
                Random()
            }
            .tabItem {
                Label {
                    R.Strings.titleRandom
                } icon: {
                    R.Icons.iconRandom
                }
            }
            
            NavigationView {
                Favorites()
            }
            .tabItem {
                Label {
                    R.Strings.titleFavorite
                } icon: {
                    R.Icons.iconFavorite
                }
                
            }
            
        }
        .tint(Color("activeTabBtn"))
        
    }
    
}


