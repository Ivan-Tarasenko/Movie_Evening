//
//  Search.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 23.07.2023.
//

import SwiftUI

struct Search<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
    
            SearchView(viewModel: MovieViewModel())
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(viewModel: MovieViewModel())
    }
}

struct SearchView<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            TextField("  Search...", text: $viewModel.searchText)
                .frame(width: viewModel.isSearch ? R.BoundsScreen.widthScreen - 65 : 45)
                .frame(height: 45)
                .background(Color("searchColor"))
                .cornerRadius(23)
            
            SearchButton() {
                withAnimation {
                    viewModel.isSearch.toggle()
                }
            }
           
        }
        .padding(.bottom, 5)
        .padding(.trailing, 30)
    }
}

struct SearchButton: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color("searchColor"))
            
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color("headerSection"))
            }
        }
    }
}
