//
//  FriendsSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

class FriendsSection: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?
    
    
    var isCollapsed = false
    
    var isCollapsible: Bool {
        return true
    }
    
    var sectionTitle: String? {
        return "FriendsSection"
    }

    var profile: Profile?
    
    var items: [GenericTableViewCellProtocol] {
        guard let friends = profile?.friends, !friends.isEmpty else {
            return []
        }
        var items: [FriendCellModel] = []
        friends.forEach { (friend) in
            items.append(FriendCellModel(friend: friend))
        }
        return items
    }
    
    init(profile: Profile, delegate: TableViewCellDelegate?) {
        self.profile = profile
        self.delegate = delegate
    }
}
