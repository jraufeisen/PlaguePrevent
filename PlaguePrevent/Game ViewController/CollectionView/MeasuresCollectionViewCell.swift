//
//  CollectionViewCell.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class MeasuresCollectionViewCell: UICollectionViewCell {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
        

        
    }

}
