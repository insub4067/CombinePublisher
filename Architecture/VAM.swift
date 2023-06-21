//
//  VAM.swift
//  TEST
//
//  Created by 김인섭 on 2023/06/10.
//

import SwiftUI
import Combine

// MARK: VAM
public protocol VAM: View {
    
    associatedtype Action: Actionable
    associatedtype Model: Modelable
    
    var action: Action { get }
    var model: Model { get }
}

// MARK: Action
public protocol Actionable {
    
    associatedtype Model
    
    @MainActor var model: Model? { get }
}

public protocol Modelable: ObservableObject { }
