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
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }
    
    private func commonInit() {
    }

    // MARK: - Public methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
