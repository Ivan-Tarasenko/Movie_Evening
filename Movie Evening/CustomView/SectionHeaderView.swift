//
//  SectionHeaderView.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 25.07.2023.
//

import SwiftUI

struct SectionHeaderView: View {
    var title: Text
    var action: () -> Void
    
    var body: some View {
        HStack {
             title
                .font(.custom(R.Fonts.interExtraLight, size: 20))
                .foregroundColor(Color.text)
            
            Spacer()
            
            Button(action: action) {
                R.Strings.seeAll
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        
    }
}
