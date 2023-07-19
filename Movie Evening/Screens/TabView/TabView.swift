//
//  TabView.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                Movies()
            }
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
        
    }
    
}


