//
//  OnlineRepository.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 14/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import SwiftyJSON
import PromiseKit

class OnlineRepository: Repository {
    
    private enum PoolInformationSequence: Int, CaseIterable {
        case getHashrate
        case getNumberOfMiners
        case getPrice
        
        func requestType(coin: String) -> RequestType {
            switch self {
            case .getHashrate: return .poolHashrate(coin: coin)
            case .getNumberOfMiners: return .numberOfMiners(coin: coin)
            case .getPrice: return .prices(coin: coin)
            }
        }
    }
    
    func getPoolInformation(for coin: String, completion block: @escaping (Swift.Result<PoolInformation, Error>) -> Void) {
        
        let operations = PoolInformationSequence.allCases.map({ SessionManager.shared.request($0.requestType(coin: coin)) })
        
        when(resolved: operations).done { (results) in
            
            var hashrate: Double?
            var numberOfMiners: Int?
            var price: Double?
            
            let hashrateIndex = PoolInformationSequence.getHashrate.rawValue
            let hashrateResult = results[hashrateIndex]
            
            switch hashrateResult {
            case .fulfilled(let json):
                hashrate = json["data"].double
            case .rejected(let error):
                block(Swift.Result.failure(error))
                return
            }
            
            let numberOfMinersIndex = PoolInformationSequence.getNumberOfMiners.rawValue
            let numberOfMinersResult = results[numberOfMinersIndex]
            
            switch numberOfMinersResult {
            case .fulfilled(let json):
                numberOfMiners = json["data"].int
            case .rejected(let error):
                block(Swift.Result.failure(error))
                return
            }
            
            let priceIndex = PoolInformationSequence.getPrice.rawValue
            let priceResult = results[priceIndex]
            
            switch priceResult {
            case .fulfilled(let json):
                if let coinPricesResource = CoinPricesResource.from(json) {
                    price = coinPricesResource.usdPrice
                } else {
                    block(Swift.Result.failure(CustomError.network))
                    return
                }
            case .rejected(let error):
                block(Swift.Result.failure(error))
                return
            }
            
            guard let totalHashrate = hashrate, let usdPrice = price, let minerCount = numberOfMiners else {
                block(Swift.Result.failure(CustomError.network))
                return
            }
            
            let poolInformation = PoolInformation(coin: coin, hashrate: totalHashrate, price: usdPrice, minerCount: minerCount)
            block(Swift.Result.success(poolInformation))
            
        }.catch { error in
            block(Swift.Result.failure(error))
        }
    }
    
    func getGeneralInfo(forCoin coin: String, andAddress address: String, completion block: @escaping (Error?) -> Void) {
        firstly {
            SessionManager.shared.request(.generalInfo(coin: coin, address: address))
        }.done { (json) in
            block(NanoError(json: json))
        }.catch { (error) in
            block(error)
        }
    }
}
