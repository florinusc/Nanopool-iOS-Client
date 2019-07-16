//
//  CoinPricesResource.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 15/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CoinPricesResource {
    let btcPrice: Double
    let usdPrice: Double
    let eurPrice: Double
    let rurPrice: Double
    let cnyPrice: Double
    let gbpPrice: Double
    
    static func from(_ json: JSON) -> CoinPricesResource? {
        
        let prices = json["data"]
        
        guard let btcPrice = prices["price_btc"].double,
            let usdPrice = prices["price_usd"].double,
            let eurPrice = prices["price_eur"].double,
            let rurPrice = prices["price_rur"].double,
            let cnyPrice = prices["price_cny"].double,
            let gbpPrice = prices["price_gbp"].double else { return nil }
        
        return CoinPricesResource(btcPrice: btcPrice,
                                  usdPrice: usdPrice,
                                  eurPrice: eurPrice,
                                  rurPrice: rurPrice,
                                  cnyPrice: cnyPrice,
                                  gbpPrice: gbpPrice)
    }
}
