//
//  RequestType.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 14/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Moya

enum RequestType {
    case poolHashrate(coin: String)
    case numberOfMiners(coin: String)
    case prices(coin: String)
    case generalInfo(coin: String, address: String)
}

extension RequestType: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .poolHashrate(let coin): return "\(coin)/pool/hashrate"
        case .numberOfMiners(let coin): return "\(coin)/pool/activeminers"
        case .prices(let coin): return "\(coin)/prices"
        case .generalInfo(let coin, let address): return "\(coin)/user/\(address)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
