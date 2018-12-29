//
//  SettingSectionView.swift
//  Around Me
//
//  Created by Miquel Masip on 23/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

enum SectionStatus {
    case expanded
    case collapsed
}

protocol SettingSectionViewDelegate {
    func toggleSection(_ header: SettingSectionView, section: Int)
}

class SettingSectionView: UITableViewHeaderFooterView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateIcon: UIImageView!

    var section: Int = 0
    var status: SectionStatus = .collapsed {
        willSet(value) {
            switch value {
            case .collapsed:
                stateIcon.image = UIImage(named: "IcoSection_Collapsed")
            case .expanded:
                stateIcon.image = UIImage(named: "IcoSection_Expanded")
            }
        }
    }
    
    var delegate: SettingSectionViewDelegate?

    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("SettingSectionView", owner: self, options: nil)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(sectionTapped(_:))))
    }

    // MARK: - Private methods
    @objc private func sectionTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let header = gestureRecognizer.view as? SettingSectionView else {
            return
        }
        
        delegate?.toggleSection(self, section: header.section)
    }
}
