//
//  AboutSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation
import UIKit

class AboutSection: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?
    
    
    var isCollapsed: Bool = false

    var isCollapsible: Bool {
        return true
    }

    var sectionTitle: String? {
        return "AboutSection"
    }
    
    var profile: Profile?
    
    var items: [GenericTableViewCellProtocol] {
        guard let about = profile?.about else {
            return []
        }
        let aboutItem = ProfileViewModelAboutItem(about: about)
        return [AboutCellModel(item: aboutItem, delegate: delegate)]
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
