//
//  UserInfoSection.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

class UserInfoSection: TableViewSectionProtocol {
    
    var profile: Profile?
    
    var isCollapsible: Bool {
        return true
    }

    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    
    var isCollapsed = true
    
    var sectionTitle: String? {
        return "UserInfo: I like travelling along Missisipi! Mississippi is a southern U.S. state with the Mississippi River to its west, the state of Alabama to its east, and the Gulf of Mexico to the south."
    }

    var items: [TableViewCellModelProtocol] {
        guard let name = profile?.fullName,
            let pictureUrl = profile?.pictureUrl,
            let email = profile?.email else {
                return []
        }
        let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
//        let dobItem = ProfileViewModelEmailItem(email: email)
        return [NamePictureModel(item: nameAndPictureItem)]
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
