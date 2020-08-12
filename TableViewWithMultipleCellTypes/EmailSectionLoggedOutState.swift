//
//  EmailSectionLoggedOutState.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.

import Foundation
import UIKit

class EmailSectionLoggedOutState: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?

    var isCollapsible: Bool {
        return true
    }

    var isCollapsed = false
    
    var sectionTitle: String? {
        return "EmailSection Gmail is a free email service developed by Google. Users can access Gmail on the web and using third-party programs that synchronize email content through POP or IMAP protocols."
    }

    var items: [GenericTableViewCellProtocol] {
        return [AboutCellLoggedOutState()]
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
