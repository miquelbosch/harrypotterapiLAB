//
//  ViewController.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 29/11/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import UIKit
import HarryPotterLab_ui_kit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let date = DateManager.toDate(from: "12/12/2021", in: .ddMMyyyy)
        
    }
}

