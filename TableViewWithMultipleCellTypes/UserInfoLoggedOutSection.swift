//
//  UserInfoLoggedOutSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.

import Foundation

class UserInfoLoggedOutSection: TableViewSectionProtocol {

    var delegate: TableViewCellDelegate?
    
    var isCollapsible: Bool {
        return true
    }
    
    var isCollapsed = false
    
    var sectionTitle: String? {
        return "UserInfo: I like travelling along Missisipi! Mississippi is a southern U.S. state with the Mississippi River to its west, the state of Alabama to its east, and the Gulf of Mexico to the south."
    }

    var items: [GenericTableViewCellProtocol] {
        return [NamePictureLoggedOutState()]
    }
    
    init(delegate: TableViewCellDelegate?) {
        self.delegate = delegate
    }

}
