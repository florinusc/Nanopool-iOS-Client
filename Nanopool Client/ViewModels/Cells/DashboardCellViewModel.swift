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
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Coins", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
        }
        return nsDictionary?[poolInformation.coin] as? String
    }
    
    var hashrateString: String {
        return "\(poolInformation.hashrate)"
    }
    
    var minerCountString: String {
        return "\(poolInformation.minerCount)"
    }
    
    var priceString: String {
        return "$ \(poolInformation.price)"
    }
    
    var coinLogoImageName: String {
        return "\(poolInformation.coin)_icon"
    }
}
