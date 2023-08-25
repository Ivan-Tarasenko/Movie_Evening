//
//  DetailAboutFilm.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 19.07.2023.
//

import SwiftUI
import Kingfisher

struct DetailAboutFilm<ViewModel: DetailAboutFilmModelProtocol>: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @State private var activateModalView = false
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Button(action: {
                coordinator.dismissFullCover()
            }, label: {
                Image(systemName: "chevron.backward")
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
//            Image("360")
            KFImage(URL(string: viewModel.tempFilmDet?.poster ?? "360"))
            
            Text("DetailView")
        }
        .onAppear(perform: {
            viewModel.getIdFromPreviewAndAllMovies()
            
        })
    }
        
}

struct DetailAboutFilm_Previews: PreviewProvider {
    static var previews: some View {
        DetailAboutFilm( viewModel: DetailAboutFilmModel())
    }
}
