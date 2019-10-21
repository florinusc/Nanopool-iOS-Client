//
//  AddressListViewController.swift
//  Nanopool Client
//
//  Created by Florin Uscatu on 21/07/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit
import SwifterSwift

class AddressListViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var shadowView: UIView!
    
    // MARK: - Private constants
    private let estimatedRowHeight: CGFloat = 70.0
    private let addViewHeight: CGFloat = 70.0
    
    // MARK: - Public variables
    var viewModel: AddressListViewModel!
    
    // MARK: - Private variables
    private var addView: AddressAddView?
    private var addViewInitialX: CGFloat {
        return view.frame.width - 70.0
    }
    private var addViewY: CGFloat {
        if let tabBarHeight = tabBarController?.tabBar.height {
            return view.frame.height - tabBarHeight - addViewHeight - 40.0
        }
        return 0.0
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        setupTableView()
        setupAddView()
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AddressTableViewCell.self)
    }
    
    private func setupAddView() {
        addView = AddressAddView.fromNib()
        addView?.frame = CGRect(x: addViewInitialX, y: addViewY, width: view.frame.width, height: addViewHeight)
        addView?.viewModel = viewModel.addressAddViewModel
        addView?.delegate = self
        guard let addView = addView else { return }
        view.addSubview(addView)
    }
}

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AddressTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension AddressListViewController: AddressAddViewDelegate {
    func toggle(expanded: Bool) {
        shadowView.isHidden = !expanded
    }
    
    func changeCoin() {}
}

extension AddressListViewController: Storyboarded {
    static var storyboardName: Storyboards { return .address }
}
