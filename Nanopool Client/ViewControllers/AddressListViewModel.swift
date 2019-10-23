//
//  AddressListViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 21/10/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class AddressListViewModel: ViewModel {
    
    // MARK: - Private constants
    private let repository: Repository!
    
    // MARK: - Public variables
    var addressAddViewModel: AddressAddViewModel {
        return AddressAddViewModel(coins: coins, repository: repository)
    }
    
    // MARK: - Private variables
    private var coins = [Coin]()
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
        getCoins()
    }
    
    // MARK: - Private helpers
    private func getCoins() {
        coins = CoinDictionary.shared.getCoins()
    }
    
}
