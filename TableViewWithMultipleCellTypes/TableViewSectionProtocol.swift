//
//  TableViewSectionProtocol.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

protocol TableViewSectionProtocol {
    var items: [TableViewCellModelProtocol] { get }
    var isCollapsed: Bool { get set }
    var sectionTitle: String? { get }
    var isCollapsible: Bool { get }
    var type: ProfileViewModelItemType { get }
    var rowCount: Int { get }
}

extension TableViewSectionProtocol {
    var rowCount: Int {
        return items.count
    }
    
    var isCollapsible: Bool {
        return true
    }
}

