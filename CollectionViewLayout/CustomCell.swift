//
//  CustomCell.swift
//  CollectionViewLayout
//
//  Created by Prachit on 14/11/23.
//

import UIKit

class CustomCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static var identifier:String {
        "CustomCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureCell (name: String) {
        imageView.image = UIImage(named: name)
    }
    
    static func nib() -> UINib {
        
        UINib(nibName: "CustomCell", bundle: nil)
    }
    

}
