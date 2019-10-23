//
//  NanoError.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 23/10/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NanoError: LocalizedError {
    
    private let description: String
    
    init?(json: JSON) {
        let status = json["status"].boolValue
        guard status == false else { return nil }
        self.description = json["error"].stringValue
    }
    
    var errorDescription: String? {
        return description
    }
}
