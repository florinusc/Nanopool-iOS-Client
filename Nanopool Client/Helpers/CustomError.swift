//
//  CustomError.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

public enum CustomError: Error {
    case general
    case invalidURL
    case network
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .general:
            return NSLocalizedString("Oops, something went wrong, please try again", comment: "General Error")
        case .invalidURL:
            return NSLocalizedString("The URL is invalid", comment: "Invalid URL")
        case .network:
            return NSLocalizedString("There was a network error", comment: "Network Error")
        }
    }
}
