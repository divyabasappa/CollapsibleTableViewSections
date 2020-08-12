//
//  FriendSectionLoggedOutState.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

class FriendSectionLoggedOutState: TableViewSectionProtocol {

    var isCollapsible: Bool {
        return true
    }

    var isCollapsed = false
    
    var sectionTitle: String? {
        return "FriendsSection"
    }

    var items: [GenericTableViewCellProtocol] {
        return [NamePictureLoggedOutState(), NamePictureLoggedOutState(), NamePictureLoggedOutState()]
    }

}
