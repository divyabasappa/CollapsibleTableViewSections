//
//  FriendSectionLoggedOutState.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.


import Foundation
import UIKit

class FriendSectionLoggedOutState: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?
    
    var isCollapsible: Bool {
        return true
    }

    var isCollapsed = false
    
    var sectionTitle: String? {
        return "FriendsSection"
    }

    var items: [GenericTableViewCellProtocol] {
        return [NamePictureLoggedOutState(), NamePictureLoggedOutState(), NamePictureLoggedOutState()]
    }
    
    init(delegate: TableViewCellDelegate?) {
        self.delegate = delegate
    }
    
    func registerCellInSection(tableView: UITableView) {
        items.forEach { (cell) in
            cell.registerCell(in: tableView)
        }
    }

}
