//
//  AddressAddViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 24/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Bond

class AddressAddViewModel {
    
    // MARK: - Private constants
    private let coins: [Coin]
    private let selectedCoin: Observable<Coin>
    private let repository: Repository!
    
    // MARK: - Public variables
    var coinToolBarViewModel: CoinToolBarViewModel {
        return CoinToolBarViewModel(coins: coins, delegate: self)
    }
    private(set) var selectedCoinImage = Observable<String?>(nil)
    
    // MARK: - Lifecycle
    init(coins: [Coin], repository: Repository) {
        self.repository = repository
        self.coins = coins
        selectedCoin = Observable<Coin>(coins[0])
        selectedCoin.map { $0.image }.bind(to: selectedCoinImage)
    }
    
    // MARK: - Public helpers
    func coinLogo(at index: UInt) -> String? {
        guard index < coins.count else { return nil }
        return coins[Int(index)].image
    }
    
    func validateAddress(address: String, completion block: @escaping (Error?) -> Void) {
        repository.getGeneralInfo(forCoin: selectedCoin.value.id, andAddress: address) { [weak self] (error) in
            guard let self = self else { return }
            if error == nil {
                let localAddress = LocalAddress(address: address, coin: self.selectedCoin.value)
                do {
                    try AddressDataStore.shared.saveAddress(localAddress)
                } catch let err {
                    block(err)
                }
            }
            block(error)
        }
    }
}

extension AddressAddViewModel: CoinToolBarDelegate {
    func didSelectCoin(_ coin: Coin) {
        selectedCoin.value = coin
    }
}
