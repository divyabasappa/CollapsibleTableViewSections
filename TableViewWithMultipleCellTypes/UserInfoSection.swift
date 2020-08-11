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
        return "UserInfo"
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
