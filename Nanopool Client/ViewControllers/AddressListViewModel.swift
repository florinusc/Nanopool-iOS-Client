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
    
    var numberOfLocalAddresses: Int {
        return addressCellViewModels.count
    }
    
    // MARK: - Private variables
    private var coins = [Coin]()
    private var localAddresses = [LocalAddress]()
    private var addressCellViewModels: [AddressCellViewModel] {
        return localAddresses.map { AddressCellViewModel.from($0) }
    }
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
        getCoins()
    }
    
    // MARK: - Public helpers
    func getAddresses() throws {
        localAddresses = try AddressDataStore.shared.getAddresses()
    }
    
    func addressCellViewModel(at indexPath: IndexPath) -> AddressCellViewModel? {
        guard indexPath.row >= 0, indexPath.row < numberOfLocalAddresses else { return nil }
        return addressCellViewModels[indexPath.row]
    }
    
    // MARK: - Private helpers
    private func getCoins() {
        coins = CoinDictionary.shared.getCoins()
    }
    
}
