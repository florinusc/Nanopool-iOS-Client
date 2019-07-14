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
    func getPoolInformation(for coin: String, completion block: @escaping (Swift.Result<PoolInformation, Error>) -> Void) {
        
        let op1 = SessionManager.shared.request(.poolHashrate(coin: coin))
        let op2 = SessionManager.shared.request(.numberOfMiners(coin: coin))
        let op3 = SessionManager.shared.request(.prices(coin: coin))
        
        firstly {
            when(resolved: op1, op2, op3)
        }.done { (results) in
            print(results)
        }.catch { error in
            print(error)
        }
    }
}
