//
//  AboutSectionLoggedOutState.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.

import Foundation

class AboutSectionLoggedOutState: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?
    
    var isCollapsible: Bool {
        return true
    }

    var isCollapsed = false
    
    var sectionTitle: String? {
        return "AboutSection"
    }

    var items: [GenericTableViewCellProtocol] {
        return [AboutCellLoggedOutState()]
    }
    
    init(delegate: TableViewCellDelegate?) {
        self.delegate = delegate
    }

}
