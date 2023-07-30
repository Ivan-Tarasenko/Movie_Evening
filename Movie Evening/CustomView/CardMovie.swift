//
//  CardMovie.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 21.07.2023.
//

import SwiftUI

struct CardMovie: View {
    
    let urlImage: String
    let name: String
    let rating: Double
    let year: Int
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Image(urlImage, bundle: nil)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 19))
                
                VStack(alignment: .leading) {
                    Text(name)
                    Text("IMDb: \(String(rating))")
                    Text("Yesr: \(String(year))")
                }
                .font(.custom(R.Fonts.robotoLight, size: 16))
                
                
            }
            .padding(10)
        }
        .background(.backgroundMovieItem)
        .clipShape(.rect(cornerRadius: 19))
        
    }
}

#Preview {
    CardMovie(urlImage: "", name: "", rating: 0.0, year: 0)
}
