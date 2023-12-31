//
//  CardMovie.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 21.07.2023.
//

import SwiftUI
import Kingfisher
import Combine

struct CardMovie: View {
    
    let urlImage: String
    let name: String
    let rating: Double
    let year: Int
    let currentID: Int
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 3) {
                KFImage(URL(string: urlImage))
                    .resizable()
                    .clipShape(.rect(cornerRadius:14))
                    .frame(width: 152, height: 208)
                
                HStack {
                    Text(name)
                        .font(.custom(R.Fonts.interLight, size: 16))
                    Spacer()
                    Text(String(year))
                        .font(.custom(R.Fonts.interExtraLight, size: 14))
                }
                .frame(width: 150)
                
                StarRatingView(viewModel: CustomViewModel(rating: rating))
                
            }
            .padding(10)
            .frame(width: 161, height: 254)
            .background(R.Colors.cardGradient)
            .clipShape(.rect(cornerRadius: 18))
            .borderWithGradient(R.Colors.borderCardGradient, width: 2, cornerRadius: 20)
        }
        
    }
}

struct CardMovie_Previews: PreviewProvider {
    static var previews: some View {

        CardMovie(urlImage: "", name: "", rating: 0.0, year: 0, currentID: 0)

    }
}

// MARK: - Components CardMovie

// MARK: - StarRationgView
struct StarRatingView<ViewModel: CustomViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        HStack(spacing: 3) {
            ForEach(viewModel.arrayRatingValues, id: \.self) { value in
                
                StarView(fillValue: value)
                
            }
            .frame(width:11, height: 11)
        }
    }
}

// MARK: - StarView
struct StarView: View {
    var fillValue: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.starInactive)
                Rectangle()
                    .fill(Color.active)
                    .frame(width: geometry.size.width * fillValue)
            }
        }
        .mask(
            Image("star")
                .resizable()
            
        )
        .aspectRatio(1, contentMode: .fit)
    }
}
