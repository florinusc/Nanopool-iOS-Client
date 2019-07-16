//
//  DashboardViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import PromiseKit

class DashboardViewModel: ViewModel {
    
    // MARK: - Private constants
    private let repository: Repository!
    
    // MARK: - Private variables
    private var poolInformationArray = [PoolInformation]()
    private var coins: [String] {
        let coinDictionary = CoinDictionary.shared.getCoinDictionary()
        return Array(coinDictionary.keys)
    }
    
    // MARK: - Public variables
    var numberOfCoins: Int {
        return poolInformationArray.count
    }
    
    // MARK: Init
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Private helpers
    private func getPoolInformation(for coin: String) -> Promise<Error?> {
        return Promise { seal in
            repository.getPoolInformation(for: coin) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    seal.reject(error)
                case .success(let poolInformation):
                    self.poolInformationArray.append(poolInformation)
                    seal.fulfill(nil)
                }
            }
        }
    }
    
    // MARK: - Public helpers
    func getPoolInformation(completion block: @escaping ([Error]) -> Void) {
        let promises = coins.map({ getPoolInformation(for: $0) })
        when(resolved: promises).done { results in
            var errors = [Error]()
            results.forEach {
                guard !$0.isFulfilled else { return }
                switch $0 {
                case .rejected(let error): errors.append(error)
                case .fulfilled: break
                }
            }
            self.poolInformationArray.sort { $0.coin < $1.coin }
            block(errors)
        }
    }
    
    func dashboardCellViewModel(at indexPath: IndexPath) -> DashboardCellViewModel? {
        guard indexPath.row < numberOfCoins else { return nil }
        return DashboardCellViewModel(poolInformation: poolInformationArray[indexPath.row])
    }
}
