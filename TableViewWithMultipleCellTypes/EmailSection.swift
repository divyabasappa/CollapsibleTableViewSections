//
//  EmailSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation

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

}
