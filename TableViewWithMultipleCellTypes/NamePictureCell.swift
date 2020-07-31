//
//  NamePictureCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import UIKit

class NamePictureCell: UITableViewCell, TableViewCellConfigurable {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var pictureImageView: UIImageView?
    
    var model: NamePictureModel?
    
    func configureWithModel(_ model: NamePictureModel) {
        self.model = model
        self.item = model.item
    }
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelNamePictureItem else {
                return
            }
            
            nameLabel?.text = item.name
            pictureImageView?.image = UIImage(named: item.pictureUrl)
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureImageView?.layer.cornerRadius = 50
        pictureImageView?.clipsToBounds = true
        pictureImageView?.contentMode = .scaleAspectFit
        pictureImageView?.backgroundColor = UIColor.lightGray
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        pictureImageView?.image = nil
    }

}
