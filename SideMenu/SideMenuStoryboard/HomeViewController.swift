//
//  HomeViewController.swift
//  SideMenuStoryboard
//
//  Created by Matt Tian on 30/03/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func toggleMenu()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func toggleMenu(_ sender: UIBarButtonItem) {
        delegate?.toggleMenu()
    }

}
