//
//  ViewController.swift
//  activityindicators
//
//  Created by Moises Anthony Aranas on 7/12/15.
//  Copyright © 2015 ganglion software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicator: GLSSpinActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

