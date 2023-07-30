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

#Preview {
   Search(viewModel: MovieViewModel())
}


struct SearchView<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            TextField("  Search...", text: $viewModel.searchText)
                .frame(width: viewModel.isSearch ? R.BoundsScreen.widthScreen - 65 : 45)
                .frame(height: 45)
                .background(.search)
                .clipShape(.rect(cornerRadius: 22.5))
            
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
                .foregroundStyle(.search)
            
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.headerSection)
            }
        }
    }
}
