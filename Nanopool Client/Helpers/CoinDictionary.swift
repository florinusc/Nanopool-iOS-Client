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
    
    func getCoins() -> [Coin] {
        if let path = Bundle.main.path(forResource: "Coins", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)?.compactMap({ (arg) -> Coin? in
                if let coinId = arg.key as? String, let coinName = arg.value as? String {
                    return Coin(id: coinId, name: coinName, image: "\(coinId)_icon")
                }
                return nil
            }) ?? []
        }
        return []
    }
}
