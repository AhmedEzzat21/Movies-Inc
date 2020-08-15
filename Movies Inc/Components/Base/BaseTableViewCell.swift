//
//  BaseTableViewCell.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//


import UIKit

class BaseTableViewCell: UITableViewCell {
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            alpha = 0.5
        } else {
            alpha = 1
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        selectionStyle = .none
        backgroundColor = .white
    }
}
