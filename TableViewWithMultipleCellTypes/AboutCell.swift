//
//  AboutCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import UIKit

class AboutCell: UITableViewCell, TableViewCellConfigurable {

    @IBOutlet weak var aboutLabel: UILabel?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard  let item = item as? ProfileViewModelAboutItem else {
                return
            }
            
            aboutLabel?.text = item.about
        }
    }
    
    var model: AboutCellModel?
    
    func configureWithModel(_ model: AboutCellModel) {
        self.model = model
        self.item = model.item
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
