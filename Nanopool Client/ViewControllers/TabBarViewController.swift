//
//  TabBarViewController.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let dashboardViewController = DashboardViewController.instantiate(with: DashboardViewModel())
        viewControllers = [dashboardViewController]
    }
}

extension TabBarViewController: Storyboarded {
    static var storyboardName: Storyboards { return .main }
}
