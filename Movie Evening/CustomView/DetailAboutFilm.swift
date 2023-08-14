//
//  DetailAboutFilm.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 19.07.2023.
//

import SwiftUI

struct DetailAboutFilm: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @State private var activateModalView = false
    
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
                    coordinator.dismissSheet()
                    coordinator.present(sheet: .fullIamge)
                }
            
            Text("DetailView")
        }
        .sheet(item: $coordinator.sheet) { sheet in
                     coordinator.build(sheet: sheet)
                 }
    }
}

struct DetailAboutFilm_Previews: PreviewProvider {
    static var previews: some View {
        DetailAboutFilm()
    }
}
