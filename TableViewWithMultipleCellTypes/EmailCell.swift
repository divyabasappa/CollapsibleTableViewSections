//
//  EmailCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import UIKit

class EmailCell: UITableViewCell, TableViewCellConfigurable {

    @IBOutlet weak var emailLabel: UILabel?
    
    var model: EmailCellModel?
    
    func configureWithModel(_ model: EmailCellModel) {
        self.model = model
        self.item = model.item
    }
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelEmailItem else {
                return
            }
            
            emailLabel?.text = item.email
        }
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
