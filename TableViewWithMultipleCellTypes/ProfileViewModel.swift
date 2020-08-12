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

    weak var delegate: TableViewCellDelegate?
    
    var reloadSections: ((_ section: Int) -> Void)?
    
    override init() {
        super.init()
    }
    
    func setUpDataSource() {
        fetchData()
        configLoggedOut()
    }
    
    func fetchData() {
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return
        }
        sections.append(UserInfoSection(profile: profile, delegate: delegate))
        sections.append(AboutSection(profile: profile, delegate: delegate))
        sections.append(EmailSection(profile: profile, delegate: delegate))
        sections.append(AttributesSection(profile: profile, delegate: delegate))
        sections.append(FriendsSection(profile: profile, delegate: delegate))
    }
    
    func configLoggedOut() {
        loggedOutSections.append(UserInfoLoggedOutSection(delegate: delegate))
        loggedOutSections.append(AboutSectionLoggedOutState(delegate: delegate))
        loggedOutSections.append(EmailSectionLoggedOutState(delegate: delegate))
        loggedOutSections.append(AttributeSectionLoggedOutState(delegate: delegate))
        loggedOutSections.append(FriendSectionLoggedOutState(delegate: delegate))
    }
    
    func registerCells(tabelView: UITableView) {
        sections.forEach { (section) in
            section.registerCellInSection(tableView: tabelView)
        }
        loggedOutSections.forEach { (section) in
            section.registerCellInSection(tableView: tabelView)
        }
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
