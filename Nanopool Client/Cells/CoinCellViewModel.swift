//
//  CoinCellViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 23/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct CoinCellViewModel {
    let imagePath: String
    let name: String
    
    static func from(_ coin: Coin) -> CoinCellViewModel {
        return CoinCellViewModel(imagePath: coin.image, name: coin.id.uppercased())
    }
}
