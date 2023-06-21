//
//  ContentViewAction.swift
//  TEST
//
//  Created by 김인섭 on 2023/06/10.
//

import SwiftUI
import Combine

@MainActor
final class ContentViewAction: NSObject, Actionable {
    
    typealias Model = ContentViewModel
    weak var model: ContentViewModel?
    
    var cancellable = Set<AnyCancellable>()
    
    init(model: ContentViewModel? = nil) {
        self.model = model
        super.init()
        self.getItems()
        self.addObserver()
    }
    
    func getItems() {
        for _ in 1...30 {
            self.model?.items.append(Item.init())
        }
    }
    
    func addObserver() {
        
        model?
            .likeOffsetPublisher
            .receive(on: RunLoop.main)
            .sink { offset in
                self.model?.items[offset].isLiked.toggle()
            }
            .store(in: &cancellable)
    }
}

