//
//  DetailAboutFilm.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 19.07.2023.
//

import SwiftUI

struct DetailAboutFilm: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Button(action: {
                coordinator.dismissFullCover()
            }, label: {
                Image(systemName: "chevron.backward")
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Image("360")
                .onTapGesture {
                    coordinator.present(sheet: .fullIamge)
                }
            Text("DetailView")
        }
    }
}

//#Preview {
//    DetailAboutFilm()
//}

struct DetailAboutFilm_Previews: PreviewProvider {
    static var previews: some View {
        DetailAboutFilm()
    }
}
