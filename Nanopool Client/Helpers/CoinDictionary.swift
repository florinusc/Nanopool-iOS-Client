//
//  CoinDictionary.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 16/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class CoinDictionary {
    
    static let shared = CoinDictionary()
    
    func getCoinDictionary() -> [String: String] {
        var dict = [String: String]()
        if let path = Bundle.main.path(forResource: "Coins", ofType: "plist") {
            dict = NSDictionary(contentsOfFile: path) as! [String : String]
        }
        return dict
    }
}
