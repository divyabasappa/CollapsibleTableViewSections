//
//  AboutSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

class AboutSection: TableViewSectionProtocol {
    
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
        return [AboutCellModel(item: aboutItem)]
    }

    init(profile: Profile) {
        self.profile = profile
    }
}
