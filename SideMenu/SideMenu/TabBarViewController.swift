//
//  TabBarViewController.swift
//  SideMenu
//
//  Created by Matt Tian on 30/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    lazy var dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        view.alpha = 0
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        let swapGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swapGesture.direction = .left
        view.addGestureRecognizer(swapGesture)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    @objc func handleMenu() {
        NotificationCenter.default.post(name: .menu, object: nil)
    }
    
    @objc func handleTap() {
        NotificationCenter.default.post(name: .tap, object: nil)
    }
    
    @objc func handleSwipe() {
        NotificationCenter.default.post(name: .swipe, object: nil)
    }

    private func setupViews() {
        viewControllers = [createDummyTabItem(title: "One"), createDummyTabItem(title: "Two")]
        
        view.addSubview(dimView)
        view.addConstraints(format: "H:|[v0]|", views: dimView)
        view.addConstraints(format: "V:|[v0]|", views: dimView)
    }
    
    private func createDummyTabItem(title: String) -> UINavigationController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        dummyViewController.navigationItem.title = title
        let menuButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleMenu))
        dummyViewController.navigationItem.leftBarButtonItem = menuButton
        
        let navController = UINavigationController(rootViewController: dummyViewController)
        navController.tabBarItem.title = title
        
        
        return navController
    }
    
}


