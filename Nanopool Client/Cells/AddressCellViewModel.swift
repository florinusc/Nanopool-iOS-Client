//
//  AddressCellViewModel.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 24/10/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct AddressCellViewModel {
    let address: String
    let imageName: String
    
    static func from(_ localAddress: LocalAddress) -> AddressCellViewModel {
        return AddressCellViewModel(address: localAddress.address, imageName: localAddress.coin.image)
    }
}
