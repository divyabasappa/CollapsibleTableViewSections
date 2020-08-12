//
//  EmailCellModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

class EmailCellModel: TableViewCellModelProtocol {

    var delegate: TableViewCellDelegate?
    
    var reuseIdentifier: String {
        return "EmailCell"
    }
    
    var item: ProfileViewModelItem?
    
    init(item: ProfileViewModelItem?) {
        self.item = item
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! EmailCell
        cell.configureWithModel(self)
        return cell
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.register(EmailCell.nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
