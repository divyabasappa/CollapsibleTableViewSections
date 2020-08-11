//
//  AttributesSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation

class AttributesSection: TableViewSectionProtocol {
    
    var isCollapsed = true
    
    var isCollapsible: Bool {
        return true
    }
    
    var sectionTitle: String? {
        return "AttributesSection"
    }

    var type: ProfileViewModelItemType {
        return .attribute
    }
    
    var profile: Profile?
    
    var items: [TableViewCellModelProtocol] {
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
    
    init(profile: Profile) {
        self.profile = profile
    }
}
