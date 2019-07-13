//
//  DashboardViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class DashboardViewModel: ViewModel {
    
    // MARK: - Private constants
    private let repository: Repository!
    private let coins = ["eth", "xmr", "etc", "zec", "rvn", "pasc", "etn", "grin"]
    
    // MARK: - Private variables
    private var poolInformationArray = [PoolInformation]()
    
    // MARK: - Public variables
    var numberOfCoins: Int {
        return poolInformationArray.count
    }
    
    // MARK: Init
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Private helpers
    private func getPoolInformation(for coin: String, completion block: @escaping (Error?) -> Void) {
        repository.getPoolInformation(for: coin) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                block(error)
            case .success(let poolInformation):
                self.poolInformationArray.append(poolInformation)
                block(nil)
            }
        }
    }
    
    // MARK: - Public helpers
    func getPoolInformation(completion block: @escaping ([Error]) -> Void) {
        var errors: [Error] = []
        coins.forEach { (coin) in
            getPoolInformation(for: coin, completion: { (error) in
                if let error = error {
                    errors.append(error)
                }
            })
        }
        block(errors)
    }
    
    func dashboardCellViewModel(at indexPath: IndexPath) -> DashboardCellViewModel? {
        guard indexPath.row < numberOfCoins else { return nil }
        return DashboardCellViewModel.from(poolInformationArray[indexPath.row])
    }
    
}
