//
//  Collection+isNotEmpty.swift
//
//  Created by Anton Bal` on 13.10.2022.
//

import Foundation

public extension Collection {
    var isNotEmpty: Bool { !isEmpty }
}

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
