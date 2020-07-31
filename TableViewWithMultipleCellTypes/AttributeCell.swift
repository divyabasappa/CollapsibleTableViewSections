//
//  AttributeCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import UIKit

class AttributeCell: UITableViewCell, TableViewCellConfigurable {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
    var model: AttributeCellModel?
    
    func configureWithModel(_ model: AttributeCellModel) {
        self.model = model
        self.item = model.attribute
    }
    
    var item: Attribute?  {
        didSet {
            titleLabel?.text = item?.key
            valueLabel?.text = item?.value
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
