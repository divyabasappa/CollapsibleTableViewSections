//
//  FriendCellModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

class FriendCellModel: TableViewCellModelProtocol {
    var delegate: TableViewCellDelegate?

    var reuseIdentifier: String {
        return "FriendCell"
    }
    
    var friend: Friend?
    
    init(friend: Friend?) {
        self.friend = friend
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! FriendCell
        cell.configureWithModel(self)
        return cell
    }

}
