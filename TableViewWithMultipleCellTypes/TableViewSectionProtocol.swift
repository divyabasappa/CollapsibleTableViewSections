//
//  TableViewSectionProtocol.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.


import Foundation

protocol TableViewSectionProtocol {
    var items: [GenericTableViewCellProtocol] { get }
    var sectionTitle: String? { get }
    var isCollapsed: Bool { get set }
    var isCollapsible: Bool { get }
    var rowCount: Int { get }
    var delegate: TableViewCellDelegate? { get set }
}

extension TableViewSectionProtocol {
    var rowCount: Int {
        return items.count
    }
    
    var isCollapsible: Bool {
        return true
    }
}

