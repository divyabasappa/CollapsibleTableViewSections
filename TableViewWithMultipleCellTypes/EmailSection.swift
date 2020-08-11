//
//  EmailSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation

class EmailSection: TableViewSectionProtocol {
    
    var isCollapsed = true
    
    var isCollapsible: Bool {
        return true
    }
    
    var sectionTitle: String? {
        "EmailSection Gmail is a free email service developed by Google. Users can access Gmail on the web and using third-party programs that synchronize email content through POP or IMAP protocols."
    }
     
    var type: ProfileViewModelItemType {
        return .email
    }

    var profile: Profile?

    var items: [TableViewCellModelProtocol] {
        guard let email = profile?.email else {
            return []
        }
        let dobItem = ProfileViewModelEmailItem(email: email)
        return [EmailCellModel(item: dobItem)]
    }
    
    init(profile: Profile) {
        self.profile = profile
    }

}
