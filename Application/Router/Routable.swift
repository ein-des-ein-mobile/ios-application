//
//  ViewFactory.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI
import Domain

typealias Routable = ViewFactory & Hashable

protocol ViewFactory {
    associatedtype Body : View
    func makeView(context: ServiceContext) -> Body
}
