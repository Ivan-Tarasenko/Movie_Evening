//
//  Movies.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI

struct CollectionView: View {
    
    let urlImage: String
    let name: String
    let rating: Double
    let year: Int
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Image(urlImage, bundle: nil)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 10))
                
                Text(name)
                Text("IMDb: \(String(rating))")
                Text(String(year))
                    
                
            }
            .padding(10)
        }
        .background(.gray)
        .clipShape(.rect(cornerRadius: 10))
        
    }
}






struct Movies<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        
        List {
            ForEach(viewModel.sections) {section in
                
                Section(header: section.titleSection) {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: columns) {
                            ForEach(viewModel.mockMovies) { movie in
                                CollectionView(
                                    urlImage: "360",
                                    name: movie.name,
                                    rating: movie.ratingImdb,
                                    year: movie.year
                                )
                                    .frame(width: 170, height: 300)
                                    
                            }
                        }
                    }
                }
                .font(.custom("Roboto-Light", size: 23))
                .headerProminence(.increased)
            }
        }
//        .navigationTitle(R.Strings.titleMovie)
    }
    
}

#Preview {
    Movies(viewModel: MovieViewModel())
}
