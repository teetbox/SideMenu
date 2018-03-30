//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Matt Tian on 29/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width / 3 * 2
    let height = UIScreen.main.bounds.height
    
    lazy var sideMenu: SideMenuView = {
        let view = SideMenuView(frame: CGRect(x: -width - 10, y: 0, width: width, height: height))
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        return view
    }()
    
    lazy var blackView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.2)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let menuButton = UIBarButtonItem(title: "Menu", style: .done, target: self, action:  #selector(handleMenu))
        navigationItem.leftBarButtonItem = menuButton
        
        setupViews()
    }
    
    @objc func handleMenu() {
        blackView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.sideMenu.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        })
    }
    
    @objc func handleTap() {
        blackView.isHidden = true
        UIView.animate(withDuration: 0.3, animations: {
            self.sideMenu.frame = CGRect(x: -self.width - 10, y: 0, width: self.width, height: self.height)
        })
    }
    
    private func setupViews() {
        view.addSubview(sideMenu)
        navigationController?.view.addSubview(sideMenu)
        view.addSubview(blackView)
        navigationController?.view.addSubview(blackView)
        blackView.isHidden = true
        let tapGestureReco = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        blackView.addGestureRecognizer(tapGestureReco)
    }
    
}
