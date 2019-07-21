//
//  Double+Extension.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 21/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    func formattedHashrate() -> String {
        let thousands = self / 1000.0
        let millions = self / 1000000.0
        if thousands > 1.0 {
            if millions > 1.0 {
                return "\(millions.format(f: "0.2")) Gh/s"
            }
            return "\(thousands.format(f: "0.2")) Kh/s"
        }
        return "\(self.format(f: "0.2")) H/s"
    }
}
