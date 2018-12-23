//
//  EmptyResultsView.swift
//  Around Me
//
//  Created by Miquel Masip on 23/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class EmptyResultsView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("EmptyResultsView", owner: self, options: nil)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true

        addSubview(view)
    }
}
