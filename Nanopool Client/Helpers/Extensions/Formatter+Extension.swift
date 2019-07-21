//
//  Formatter+Extension.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 21/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
