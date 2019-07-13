//
//  ViewController.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 11/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, ViewModelBased {
    
    // MARK: - Public variables
    var viewModel: DashboardViewModel!
}

extension DashboardViewController: Storyboarded {
    static var storyboardName: Storyboards { return .main }
}

