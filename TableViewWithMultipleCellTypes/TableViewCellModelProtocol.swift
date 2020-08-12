//
//  TableViewCellModelProtocol.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

protocol TableViewCellModelProtocol: GenericTableViewCellProtocol {
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
}
