//
//  CoinToolBarViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 23/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol CoinToolBarDelegate: class {
    func didSelectCoin(_ coin: Coin)
}

class CoinToolBarViewModel {
    
    // MARK: - Public variables
    var numberOfCoins: Int {
        coins.count
    }
    
    // MARK: - Private variables
    private var coins = [Coin]()
    private weak var delegate: CoinToolBarDelegate!
    
    // MARK: - Lifecycle
    init(coins: [Coin], delegate: CoinToolBarDelegate) {
        self.coins = coins
        self.delegate = delegate
    }
    
    // MARK: - Public helpers
    func coinCellViewModel(at indexPath: IndexPath) -> CoinCellViewModel? {
        guard indexPath.row >= 0, indexPath.row < numberOfCoins else { return nil }
        return CoinCellViewModel.from(coins[indexPath.item])
    }
    
    func selectedCoin(at index: Int) {
        guard index >= 0, index < numberOfCoins else { return }
        delegate.didSelectCoin(coins[index])
    }
    
}
