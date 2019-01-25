//
//  FilterTableViewCell.swift
//  Around Me
//
//  Created by Miquel Masip on 11/01/2019.
//  Copyright © 2019 Miquel Masip. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusIcon: UIImageView!
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
    }
}
