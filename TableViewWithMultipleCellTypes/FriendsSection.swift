//
//  FriendsSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

class FriendsSection: TableViewSectionProtocol {
    
    var isCollapsed = true
    
    var isCollapsible: Bool {
        return true
    }
    
    var sectionTitle: String? {
        return "FriendsSection"
    }
    
    var type: ProfileViewModelItemType {
        return .friend
    }
    
    var rowCount: Int {
        return items.count
    }
    
    var profile: Profile?
    
    var items: [TableViewCellModelProtocol] {
        guard let friends = profile?.friends, !friends.isEmpty else {
            return []
        }
        var items: [FriendCellModel] = []
        friends.forEach { (friend) in
            items.append(FriendCellModel(friend: friend))
        }
        return items
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
