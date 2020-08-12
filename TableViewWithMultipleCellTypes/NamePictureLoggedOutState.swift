//
//  NamePictureLoggedOutState.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.

import Foundation
import UIKit

class NamePictureLoggedOutState: TableViewCellLoadingStateProtocol {
    func registerCell(in tableView: UITableView) {
        tableView.register(LoadingStateTableViewCell.nib, forCellReuseIdentifier: reuseIdentifier)
    }

    var reuseIdentifier: String {
        return "LoadingStateTableViewCell"
    }

    var loadingStateImageName: String {
        return "UserInfoLoadingState"
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! LoadingStateTableViewCell
        cell.configureWithModel(self)
        return cell
    }
}
