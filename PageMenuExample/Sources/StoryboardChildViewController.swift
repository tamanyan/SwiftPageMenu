//
//  StoryboardChildViewController.swift
//  PageMenuExample
//
//  Created by Tamanyan on 9/3/31 H.
//  Copyright © 31 Heisei Tamanyan. All rights reserved.
//

import UIKit

class StoryboardChildViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.title
    }
}
