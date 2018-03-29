//
//  SideMenuView.swift
//  SideMenu
//
//  Created by Matt Tian on 29/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

class SideMenuView: UIView {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Swift"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .orange
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .cyan
        
        setupViews()
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addConstraints(format: "H:|[v0]|", views: nameLabel)
        addConstraints(format: "V:|-20-[v0(80)]", views: nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
