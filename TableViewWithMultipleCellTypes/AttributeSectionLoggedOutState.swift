//
//  AttributeSectionLoggedOutState.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.

import Foundation
import UIKit

class AttributeSectionLoggedOutState: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?
    
    var isCollapsible: Bool {
        return true
    }
    
    var isCollapsed = false
    
    var sectionTitle: String? {
        return "AttributesSection"
    }

    var items: [GenericTableViewCellProtocol] {
        return [AttributeLoggedOutState()]
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
