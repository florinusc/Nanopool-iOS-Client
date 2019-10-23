//
//  Repository.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol Repository {
    func getPoolInformation(for coin: String, completion block: @escaping (Result<PoolInformation, Error>) -> Void)
    func getGeneralInfo(forCoin coin: String, andAddress address: String, completion block: @escaping (Error?) -> Void)
}
