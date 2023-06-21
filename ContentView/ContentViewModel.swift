//
//  ContentViewModel.swift
//  TEST
//
//  Created by 김인섭 on 2023/06/10.
//

import SwiftUI
import Combine

@MainActor
final class ContentViewModel: Modelable {
        
    let likeOffsetPublisher = PassthroughSubject<Int, Never>()
    @Published var items: [Item] = []
}

struct Item: Identifiable {
    
    let id = UUID().uuidString
    let color = Color.random
    var isLiked = Bool.random()
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
