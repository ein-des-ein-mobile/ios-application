//
//  UseCaseProvider.swift
//  Template
//
//  Created by Anton Bal` on 10.11.2022.
//

import Foundation
import Core

protocol UseCaseProvider {
    var sessionUseCase: any SessionUseCase { get }
}
