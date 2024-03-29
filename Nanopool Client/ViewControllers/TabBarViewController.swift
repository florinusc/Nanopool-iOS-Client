//
//  TabBarViewController.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 13/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Private constants
    private let repository = OnlineRepository()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let dashboardViewController = DashboardViewController.instantiate(with: DashboardViewModel(repository: repository))
        dashboardViewController.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "dashboard"), tag: 0)
        let addressViewController = AddressListViewController.instantiate(with: AddressListViewModel(repository: repository))
        addressViewController.tabBarItem = UITabBarItem(title: "Address", image: UIImage(named: "plus"), tag: 1)
        viewControllers = [dashboardViewController, addressViewController]
    }
}

extension TabBarViewController: Storyboarded {
    static var storyboardName: Storyboards { return .main }
}
