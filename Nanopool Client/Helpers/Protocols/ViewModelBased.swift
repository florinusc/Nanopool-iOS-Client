//
//  ViewModelBased.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

protocol ViewModelBased: class {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: Storyboarded & UIViewController {
    static func instantiate(with viewModel: ViewModelType) -> Self {
        let viewController = Self.getInstance()
        viewController.viewModel = viewModel
        return viewController
    }
}

