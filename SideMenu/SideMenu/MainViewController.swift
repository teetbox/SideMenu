//
//  MainViewController.swift
//  SideMenu
//
//  Created by Matt Tian on 30/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let menu = Notification.Name("menu")
    static let tap = Notification.Name("tap")
    static let leftSwipe = Notification.Name("leftSwipe")
    static let rightSwipe = Notification.Name("rightSwipe")
}

class MainViewController: UIViewController {
    
    let tabBarVC: TabBarViewController = {
        let tabBar = TabBarViewController()
        return tabBar
    }()
    
    var isMenuDisplayed = false
    var menuLeadingAnchor: NSLayoutConstraint!
    let menuVC: MenuViewController = {
        let menu = MenuViewController()
        return menu
    }()
    
    let menuWidth = UIScreen.main.bounds.width * 3 / 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleMenu), name: .menu, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTap), name: .tap, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleLeftSwipe), name: .leftSwipe, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRightSwipe), name: .rightSwipe, object: nil)
        
        setupViews()
    }
    
    private func setupViews() {
        addChildVC(menuVC)
        view.addConstraints(format: "H:[v0(\(menuWidth))]", views: menuVC.view)
        view.addConstraints(format: "V:|[v0]|", views: menuVC.view)
        menuLeadingAnchor = menuVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -menuWidth)
        menuLeadingAnchor.isActive = true
        
        addChildVC(tabBarVC)
        view.addConstraints(format: "H:[v0(\(view.frame.width))]", views: tabBarVC.view)
        view.addConstraints(format: "V:|[v0]|", views: tabBarVC.view)
        tabBarVC.view.leadingAnchor.constraint(equalTo: menuVC.view.trailingAnchor).isActive = true
    }
    
    @objc func handleMenu() {
        menuLeadingAnchor.constant = isMenuDisplayed ? -menuWidth : 0
        
        UIView.animate(withDuration: 0.3) {
            self.tabBarVC.dimView.alpha =  self.isMenuDisplayed ? 0 : 1
            self.view.layoutIfNeeded()
        }

        isMenuDisplayed = !isMenuDisplayed
    }
    
    @objc func handleTap() {
        handleMenu()
    }
    
    @objc func handleLeftSwipe() {
        handleMenu()
    }
    
    @objc func handleRightSwipe() {
        handleMenu()
    }

}
