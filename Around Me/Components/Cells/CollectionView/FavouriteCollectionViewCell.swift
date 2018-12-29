//
//  FavouriteCollectionViewCell.swift
//  Around Me
//
//  Created by Miquel Masip on 22/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeIcon: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    var placeId: String!
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }

    private func commonInit() {
    }
}