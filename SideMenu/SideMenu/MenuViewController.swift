//
//  MenuViewController.swift
//  SideMenu
//
//  Created by Matt Tian on 30/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        let swapGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        swapGesture.direction = .left
        view.addGestureRecognizer(swapGesture)
    }
    
    @objc func handleLeftSwipe() {
        NotificationCenter.default.post(name: .leftSwipe, object: nil)
    }

}
