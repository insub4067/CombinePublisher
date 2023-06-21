//
//  DetailItemView.swift
//  TEST
//
//  Created by 김인섭 on 2023/06/21.
//

import SwiftUI
import Combine

struct DetailItemView: View {
    
    @State var item: Item
    let offset: Int
    
    var publisher: PassthroughSubject<Int, Never>
    
    init(item: Item, offset: Int, publisher: PassthroughSubject<Int, Never>) {
        self._item = State(wrappedValue: item)
        self.offset = offset
        self.publisher = publisher
    }
    
    var body: some View {
        VStack {
            Image(systemName: item.isLiked ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(item.isLiked ? .red : .black)
                .onTapGesture {
                    item.isLiked.toggle()
                    publisher.send(offset)
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(item.color.opacity(0.3))
    }
}
