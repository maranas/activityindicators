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
    @IBOutlet weak var bouncingBarsActivityInidicator: GLSBouncingBarsActivityIndicatorView!
    @IBOutlet weak var zoomingDotsActivityIndicator: GLSZoomingDotsActivityIndicatorView!
    @IBOutlet weak var ripplesActivityIndicator: GLSRipplesActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // arc spinner
        self.activityIndicator.startAnimating()
        
        // image rotator
        self.imageActivityIndicator.setImage(UIImage(named: "logo.png")!)
        self.imageActivityIndicator.backgroundColor = UIColor.white
        self.imageActivityIndicator.startAnimating()
        
        // bouncing bars
        self.bouncingBarsActivityInidicator.color = UIColor.red
        self.bouncingBarsActivityInidicator.startAnimating()
        
        // zooming dots
        self.zoomingDotsActivityIndicator.color = UIColor.red
        self.zoomingDotsActivityIndicator.startAnimating()
        
        // ripples
        self.ripplesActivityIndicator.color = UIColor.red
        self.ripplesActivityIndicator.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

