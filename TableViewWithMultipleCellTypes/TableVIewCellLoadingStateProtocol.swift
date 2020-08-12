//
//  TableViewCellLoadingStateProtocol.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.

import Foundation
import UIKit

protocol GenericTableViewCellProtocol {
    var reuseIdentifier: String { get }
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
    func registerCell(in tableView: UITableView)
}

protocol TableViewCellLoadingStateProtocol: GenericTableViewCellProtocol {
    var loadingStateImageName: String { get }
}
