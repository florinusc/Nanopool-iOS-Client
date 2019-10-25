//
//  AddressDataStore.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 24/10/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class AddressDataStore {
    
    private let savedAddressesKey = "savedAddresses"
    
    static let shared = AddressDataStore()
    
    func saveAddress(_ address: LocalAddress) throws {
        var addresses = try getAddresses()
        addresses.append(address)
        let addressesData = try JSONEncoder().encode(addresses)
        UserDefaults.standard.set(addressesData, forKey: savedAddressesKey)
    }
    
    func getAddresses() throws -> [LocalAddress]  {
        guard let addressesData = UserDefaults.standard.data(forKey: savedAddressesKey) else { return [] }
        return try JSONDecoder().decode([LocalAddress].self, from: addressesData)
    }
}
