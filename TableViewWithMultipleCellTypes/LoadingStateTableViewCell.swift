//
//  LoadingStateTableViewCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 8/11/20.


import UIKit

class LoadingStateTableViewCell: UITableViewCell, TableViewCellConfigurable {
    
    var model: TableViewCellLoadingStateProtocol?
    
    @IBOutlet weak var loadingStateimageView: UIImageView!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithModel(_ loadinStateModel: TableViewCellLoadingStateProtocol) {
        guard let image = UIImage(named: loadinStateModel.loadingStateImageName) else {
            return
        }
        loadingStateimageView.image = image
    }
}
