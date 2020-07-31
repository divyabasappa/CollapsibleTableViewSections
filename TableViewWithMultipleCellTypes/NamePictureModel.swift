//
//  NamePictureModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

class NamePictureModel: TableViewCellModelProtocol {
    
    var reuseIdentifier: String {
        return "NamePictureCell"
    }
    
    var item: ProfileViewModelItem?
    
    init(item: ProfileViewModelItem?) {
        self.item = item
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! NamePictureCell
        cell.configureWithModel(self)
        return cell
    }
    
}
