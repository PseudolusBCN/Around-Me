//
//  PlaceCollectionViewCell.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol PlaceCollectionViewCellDelegate {
    func favouriteButton_Pressed(_ button: UIButton, placeId: String)
}

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeIcon: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var placeId: String!
    
    var delegate: PlaceCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }

    // MARK: - Configuration
    private func commonInit() {
    }

    // MARK: - Actions
    @IBAction func favouriteButton_Pressed(_ sender: Any) {
        delegate?.favouriteButton_Pressed(sender as! UIButton, placeId: placeId)
    }
}
