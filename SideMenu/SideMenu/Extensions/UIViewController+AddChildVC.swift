//
//  UIViewController+AddChildVC.swift
//  SideMenu
//
//  Created by Matt Tian on 30/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChildVC(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
    
}
