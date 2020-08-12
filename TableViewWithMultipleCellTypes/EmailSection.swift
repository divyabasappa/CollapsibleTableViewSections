//
//  EmailSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

class EmailSection: TableViewSectionProtocol {

    var delegate: TableViewCellDelegate?

    var isCollapsed = false
    
    var isCollapsible: Bool {
        return true
    }
    
    var sectionTitle: String? {
        "EmailSection"
    }

    var profile: Profile?

    var items: [GenericTableViewCellProtocol] {
        guard let email = profile?.email else {
            return []
        }
        let dobItem = ProfileViewModelEmailItem(email: email)
        return [EmailCellModel(item: dobItem)]
    }
    
    init(profile: Profile, delegate: TableViewCellDelegate?) {
        self.profile = profile
        self.delegate = delegate
    }
    
    func registerCellInSection(tableView: UITableView) {
        items.forEach { (cell) in
            cell.registerCell(in: tableView)
        }
    }

}
