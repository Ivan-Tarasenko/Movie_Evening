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
                .font(.custom(R.Fonts.interLight, size: 18))
                .foregroundColor(Color.text)
            
            Spacer()
            
            Button(action: action) {
                R.Strings.seeAll
                    .font(.custom(R.Fonts.interExtraLight, size: 14))
                    .foregroundColor(Color.subtext)
            }
        }
        .padding(.horizontal, 20)
    }
}
