//
//  ButtonCollectionViewCell.swift
//  Apple Watch UI
//
//  Created by Dylan Mace on 12/8/20.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = frame.width / 2.0;
        let color: UIColor = UIColor.random
        contentView.layer.backgroundColor = color.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
