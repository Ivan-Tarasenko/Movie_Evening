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
                .frame(width: viewModel.isSearch ? R.BoundsScreen.widthScreen - 65 : 50)
                .frame(height: 50)
                .background(.search)
                .clipShape(.rect(cornerRadius: 25))
            
            SearchButton() {
                withAnimation {
                    viewModel.isSearch.toggle()
                }
            }
           
        }
        .padding()
        .padding(.trailing, 20)
    }
}

struct SearchButton: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundStyle(.search)
            
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.headerSection)
            }
        }
    }
}
