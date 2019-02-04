//
//  RatingView.swift
//  Around Me
//
//  Created by Miquel Masip on 26/01/2019.
//  Copyright © 2019 Miquel Masip. All rights reserved.
//

import UIKit

class RatingView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var imageIcon1: UIImageView!
    @IBOutlet weak var imageIcon2: UIImageView!
    @IBOutlet weak var imageIcon3: UIImageView!
    @IBOutlet weak var imageIcon4: UIImageView!
    @IBOutlet weak var imageIcon5: UIImageView!
    
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
        Bundle.main.loadNibNamed("RatingView", owner: self, options: nil)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)

        setRating(0.0)
    }
    
    // MARK: - Public methods
    func setRating(_ rating: Double) {
        imageIcon1.image = UIImage(named: ratingImage(1, rating: rating))
        imageIcon2.image = UIImage(named: ratingImage(2, rating: rating))
        imageIcon3.image = UIImage(named: ratingImage(3, rating: rating))
        imageIcon4.image = UIImage(named: ratingImage(4, rating: rating))
        imageIcon5.image = UIImage(named: ratingImage(5, rating: rating))
    }
    
    // MARK: - Private methods
    private func ratingImage(_ position: Int, rating: Double) -> String {
        var icon: String = ""
        let integerRating: Int = Int(rating)
        let decimalRating: Int = Int((rating - Double(integerRating)) * 10)

        if position < integerRating {
            icon = "IcoRating_Full"
        } else if position == integerRating {
            icon = (decimalRating < 5) ? "IcoRating_Empty" : "IcoRating_Half"
        } else if position > integerRating {
            icon = "IcoRating_Empty"
        }
        return icon
    }
}
