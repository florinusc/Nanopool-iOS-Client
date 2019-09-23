//
//  CoinToolBarViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 23/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class CoinToolBarViewModel {
    
    // MARK: - Public variables
    var numberOfCoins: Int {
        coins.count
    }
    
    // MARK: - Private variables
    private var coins = [Coin]()
    
    // MARK: - Lifecycle
    init() {
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        getCoins()
    }
    
    // MARK: - Private helpers
    private func getCoins() {
        coins = CoinDictionary.shared.getCoinDictionary().map { (coin) -> Coin in
            return Coin(id: coin.key, name: coin.value, image: "\(coin.key)_icon")
        }
    }
    
    // MARK: - Public helpers
    func coinCellViewModel(at indexPath: IndexPath) -> CoinCellViewModel? {
        guard indexPath.row >= 0, indexPath.row < numberOfCoins else { return nil }
        return CoinCellViewModel(imagePath: coins[indexPath.row].image)
    }
    
}
