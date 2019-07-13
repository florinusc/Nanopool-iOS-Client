//
//  Storyboarded.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static var storyboardName: Storyboards { get }
}

extension Storyboarded where Self: UIViewController {
    static func getInstance() -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}

enum Storyboards: String {
    case main = "Main"
}
