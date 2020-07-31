//
//  TableViewCellConfigurable.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import Foundation

protocol TableViewCellConfigurable {
    associatedtype T
    var model: T? { get set }
    func configureWithModel(_: T)
}
