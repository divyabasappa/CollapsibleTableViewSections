//
//  ProfileViewModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation
import UIKit

protocol ProfileViewModelItem {}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
    
    var isCollapsible: Bool {
        return true
    }
}

class ProfileViewModel: NSObject {

    var sections = [TableViewSectionProtocol]()
    var loggedOutSections = [TableViewSectionProtocol]()
    
    var reloadSections: ((_ section: Int) -> Void)?
    
    override init() {
        super.init()
        fetchData()
        configLoggedOut()
    }
    
    func fetchData() {
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return
        }
        sections.append(UserInfoSection(profile: profile))
        sections.append(AboutSection(profile: profile))
        sections.append(EmailSection(profile: profile))
        sections.append(AttributesSection(profile: profile))
        sections.append(FriendsSection(profile: profile))
    }
    
    func configLoggedOut() {
        loggedOutSections.append(UserInfoLoggedOutSection())
        loggedOutSections.append(AboutSectionLoggedOutState())
        loggedOutSections.append(EmailSectionLoggedOutState())
        loggedOutSections.append(AttributeSectionLoggedOutState())
        loggedOutSections.append(FriendSectionLoggedOutState())
    }

}

class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

class ProfileViewModelAboutItem: ProfileViewModelItem {
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class ProfileViewModelEmailItem: ProfileViewModelItem {
    
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

class ProfileViewModeAttributeItem: ProfileViewModelItem {
    
    var rowCount: Int {
        return attributes.count
    }
    
    var attributes: [Attribute]
    
    init(attributes: [Attribute]) {
        self.attributes = attributes
    }
}

class ProfileViewModeFriendsItem: ProfileViewModelItem {
    
    var rowCount: Int {
        return friends.count
    }
    
    var friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}
