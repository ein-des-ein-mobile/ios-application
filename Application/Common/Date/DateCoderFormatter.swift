//
//  DateCoderFormatter.swift
//  Core
//
//  Created by Anton Bal` on 02.10.2022.
//

import Foundation
import Core

final class ShortDateCoder: DateCoder {
    override class var formatter: CustomDateFormatter? {
        DateFormatter.shortDateFormat
    }
}
