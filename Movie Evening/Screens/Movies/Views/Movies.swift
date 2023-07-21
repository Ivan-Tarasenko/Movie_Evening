//
//  Movies.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI
////////////////////////////////////////////////////////////////////////////////////
struct CollectionView: View {
    let title: String
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.random)
                Text(title)
                    .font(.title2)
            }
            Text("test")
        }
        
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

// MARK: - CardView
struct Card: Identifiable {
    let id = UUID()
    let title: String
}
// MARK: - RowView


struct MockStore {
    static var cards = [
        Card(title: "Italy"),
        Card(title: "England"),
        Card(title: "Portugal"),
        Card(title: "Belgium"),
        Card(title: "Germany"),
        Card(title: "Mexico"),
        Card(title: "Canada"),
        Card(title: "Italy"),
        Card(title: "England"),
        Card(title: "Portugal"),
        Card(title: "Belgium"),
        Card(title: "Germany"),
        Card(title: "Mexico"),
        Card(title: "Canada"),
        Card(title: "England"),
        Card(title: "Portugal"),
        Card(title: "Belgium"),
        Card(title: "Germany"),
        Card(title: "Mexico"),
        Card(title: "Canada"),
    ]
}




struct Movies: View {
       var columns: [GridItem] = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]

       let height: CGFloat = 290
 
       let cards: [Card] = MockStore.cards
    
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing:40) {
                ForEach(cards) { card in
                    CollectionView(title: card.title)
                        .frame(height: height)

                }
            }
            .padding()
            .scrollTargetLayout()
        }
        .navigationTitle(R.Strings.titleMovie)
        .scrollTargetBehavior(.viewAligned)
    }
    
}

#Preview {
    Movies()
}
