//
//  BaseTableViewHeaderFooterView.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//


import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView, Identifiable {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        let bgView = UIView(frame: bounds)
        bgView.backgroundColor = .white
        backgroundView = bgView
    }
}
