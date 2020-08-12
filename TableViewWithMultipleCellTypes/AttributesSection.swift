//
//  AttributesSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation

class AttributesSection: TableViewSectionProtocol {
    
    var delegate: TableViewCellDelegate?

    var isCollapsed = false
    
    var isCollapsible: Bool {
        return true
    }
    
    var sectionTitle: String? {
        return "AttributesSection"
    }
    
    var profile: Profile?
    
    var items: [GenericTableViewCellProtocol] {
        guard let attributes = profile?.profileAttributes,
            !attributes.isEmpty else {
                return []
        }
        var items: [AttributeCellModel] = []
        attributes.forEach {
            items.append(AttributeCellModel(attribute: $0))
        }
        return items
    }
    
    init(profile: Profile, delegate: TableViewCellDelegate?) {
        self.profile = profile
        self.delegate = delegate
    }
}
