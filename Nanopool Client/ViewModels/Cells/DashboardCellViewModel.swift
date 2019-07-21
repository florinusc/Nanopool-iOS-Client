//
//  DashboardCellViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct DashboardCellViewModel {
    let poolInformation: PoolInformation
    
    var coinName: String? {
        let coinDictionary = CoinDictionary.shared.getCoinDictionary()
        return coinDictionary[poolInformation.coin]
    }
    
    var hashrateString: String {
        return poolInformation.hashrate.formattedHashrate()
    }
    
    var minerCountString: String {
        return poolInformation.minerCount.formattedWithSeparator
    }
    
    var priceString: String {
        return "$\(poolInformation.price.format(f: "0.2"))"
    }
    
    var coinLogoImageName: String {
        return "\(poolInformation.coin)_icon"
    }
}
