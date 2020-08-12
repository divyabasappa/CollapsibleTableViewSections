//
//  UserInfoSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

class UserInfoSection: TableViewSectionProtocol {
    var delegate: TableViewCellDelegate?

    var profile: Profile?
    
    var isCollapsible: Bool {
        return true
    }
    
    var isCollapsed = false
    
    var sectionTitle: String? {
        return "UserInfo: I like travelling along Missisipi! Mississippi is a southern U.S. state with the Mississippi River to its west, the state of Alabama to its east, and the Gulf of Mexico to the south."
    }

    var items: [GenericTableViewCellProtocol] {
        guard let name = profile?.fullName,
            let pictureUrl = profile?.pictureUrl else {
                return []
        }
        let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
        return [NamePictureModel(item: nameAndPictureItem), NamePictureModel(item: nameAndPictureItem), NamePictureModel(item: nameAndPictureItem)]
    }
    
    init(profile: Profile, delegate: TableViewCellDelegate?) {
        self.profile = profile
        self.delegate = delegate
    }
}
