//
//  SettingTableViewCell.swift
//  Around Me
//
//  Created by Miquel Masip on 23/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
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
