//
//  AddressAddViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 24/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct AddressAddViewModel {
    
    // MARK: - Public variables
    var coinToolBarViewModel: CoinToolBarViewModel {
        return CoinToolBarViewModel(coins: coins)
    }
    
    // MARK: - Private variables
    private let coins: [Coin]
    
    // MARK: - Lifecycle
    init(coins: [Coin]) {
        self.coins = coins
    }
    
    // MARK: - Public helpers
    func coinLogo(at index: UInt) -> String? {
        guard index < coins.count else { return nil }
        return coins[Int(index)].image
    }
}
