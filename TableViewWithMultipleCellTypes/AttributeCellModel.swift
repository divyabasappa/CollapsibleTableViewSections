//
//  AttributeCellModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

class AttributeCellModel: TableViewCellModelProtocol {
    
    var delegate: TableViewCellDelegate?

    var reuseIdentifier: String {
        return "AttributeCell"
    }
    
    var attribute: Attribute?
    
    init(attribute: Attribute?) {
        self.attribute = attribute
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! AttributeCell
        cell.configureWithModel(self)
        return cell
    }

    func registerCell(in tableView: UITableView) {
        tableView.register(AttributeCell.nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
