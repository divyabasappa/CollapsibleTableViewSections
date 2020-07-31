//
//  AboutCellModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

class AboutCellModel: TableViewCellModelProtocol {
    
    var reuseIdentifier: String {
        return "AboutCell"
    }
    
    var item: ProfileViewModelItem?
    
    init(item: ProfileViewModelItem?) {
        self.item = item
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! AboutCell
        cell.configureWithModel(self)
        return cell
    }

}
