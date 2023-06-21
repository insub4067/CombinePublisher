//
//  ContentView.swift
//  TEST
//
//  Created by 김인섭 on 2023/06/02.
//

import SwiftUI

struct ContentView: VAM {

    // MARK: VAM
    typealias Action = ContentViewAction
    typealias Model = ContentViewModel
    
    let action: Action
    @StateObject var model: Model
    
    var body: some View {
        NavigationView {
              ScrollView {
                  LazyVStack {
                      ForEach(Array(model.items.enumerated()), id: \.offset) { offset, item in
                          // MARK: - Cell
                          NavigationLink {
                              DetailItemView(item: item, offset: offset, publisher: model.likeOffsetPublisher)
                          } label: {
                              Cell(item: item, offset: 0)
                          }
                      }
                  }
              }
          }
    }
    
    @ViewBuilder
    func Cell(item: Item, offset: Int) -> some View {
        HStack(spacing: 16) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(item.color)
            Spacer()
            Text("\(String(item.id.prefix(8)))")
                .font(.body)
            Image(systemName: item.isLiked ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(item.isLiked ? .red : .black)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}


extension ContentView {
    
    static func build() -> ContentView {
        let model = ContentViewModel()
        let action = ContentViewAction(model: model)
        
        return .init(action: action, model: model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView
                .build()
        }
    }
}
