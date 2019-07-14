//
//  SessionManager.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 14/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import PromiseKit

class SessionManager {
    static let shared = SessionManager()
    
    private func request(_ type: RequestType, completion block: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let provider = MoyaProvider<RequestType>()
        provider.request(type) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(data: response.data)
                    block(Swift.Result.success(json))
                } catch let error {
                    block(Swift.Result.failure(error))
                    return
                }
            case let .failure(error):
                block(Swift.Result.failure(error))
            }
        }
    }
    
    func request(_ type: RequestType) -> Promise<JSON> {
        return Promise { seal in
            request(type, completion: { (result) in
                switch result {
                case .failure(let error):
                    seal.reject(error)
                case .success(let json):
                    seal.fulfill(json)
                }
            })
        }
    }
}
