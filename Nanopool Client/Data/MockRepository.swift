//
//  MockRepository.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class MockRepository: Repository {
    
    let shouldReturnError: Bool
    
    init(shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
    
    func getPoolInformation(for coin: String, completion block: @escaping (Result<PoolInformation, Error>) -> Void) {
        if shouldReturnError {
            block(Result.failure(CustomError.network))
            return
        }
        block(Result.success(PoolInformation(coin: coin, hashrate: 583434, price: 205, minerCount: 345354)))
    }
    
    func getGeneralInfo(forCoin coin: String, andAddress address: String, completion block: @escaping (Error?) -> Void) {
        if shouldReturnError {
            block(CustomError.network)
            return
        }
        block(nil)
    }
}
