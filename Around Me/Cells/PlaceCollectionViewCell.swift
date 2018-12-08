//
//  PlaceCollectionViewCell.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeIcon: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var favouritesButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func favouritesButton_Pressed(_ sender: Any) {
        print("favouritesButton_Pressed")
    }
}
