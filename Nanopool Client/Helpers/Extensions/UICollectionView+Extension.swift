//
//  UICollectionView+Extension.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 12/09/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type, hasNib: Bool = true) {
        if hasNib {
            let bundle = Bundle(for: T.self)
            let nib = UINib(nibName: T.nibName, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
        } else {
            register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Not able to deque a cell")
        }
        
        return cell
    }
}
