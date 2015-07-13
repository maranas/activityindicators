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
    @IBOutlet weak var imageActivityIndicator: GLSImageRotationsActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // arc spinner
        self.activityIndicator.startAnimating()
        
        // image rotator
        self.imageActivityIndicator.setImage(UIImage(named: "logo.png")!)
        self.imageActivityIndicator.backgroundColor = UIColor.whiteColor()
        self.imageActivityIndicator.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

