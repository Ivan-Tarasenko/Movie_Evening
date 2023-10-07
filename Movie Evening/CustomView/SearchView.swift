//
//  SearchView.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 23.07.2023.
//

import SwiftUI

struct SearchView<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            SearchField(viewModel: MovieViewModel())
            
            ConfigButton {
                print("configureTap")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(R.Colors.darkeningGradient)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: MovieViewModel())
    }
}

// MARK: - Components Search

// MARK: - ConfigButton
struct ConfigButton: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.searchColor)
                .borderWithGradient(R.Colors.borderSearchGradient, width: 1, cornerRadius: 23)
                .padding(.horizontal, 5)
            
            Button(action: action) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundStyle(Color.active)
                    .font(.system(size: 27))
            }
        }
    }
}

// MARK: - SearchView
struct SearchField<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            TextField("  Search...", text: $viewModel.searchText)
                .frame(width: R.BoundsScreen.widthScreen - 80, height: 45)
                .background(Color.searchColor)
                .cornerRadius(23)
                .borderWithGradient(R.Colors.borderSearchGradient, width: 1, cornerRadius: 23)
            
            SearchButton() {
                
            }
           
        }

    }
}

// MARK: - SearchButton
struct SearchButton: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.searchColor)
            
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color.MagnifyingglassColor)
                    .font(.system(size: 27))
            }
        }
    }
}
