//
//  instaImageCell.swift
//  CollectionViewLayout
//
//  Created by Prachit on 14/11/23.
//

import UIKit

class InstaImageCell: UICollectionViewCell {
    
    static let identifier: String = "InstaImageCell"
    
    private lazy var imageview: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageview)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageview.frame = contentView.bounds
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageview.image = nil
    }
    
    public func configure(_ image: Images) {
        imageview.image = UIImage(named: image.name)
    }
    
}
